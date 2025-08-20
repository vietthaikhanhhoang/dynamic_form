// camera_screen.dart
// A single-screen Flutter camera with two modes:
//  - QR mode: rectangular capture guide
//  - CCCD mode: square capture guide
// Features: flash toggle (off/auto/on/torch), front/back switch, capture button.
// Returns captured XFile via Navigator.pop(context, XFile).

import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:image/image.dart' as img;

enum CaptureMode { qr, cccd }

class SmartCameraScreen extends StatefulWidget {
  const SmartCameraScreen({
    super.key,
    this.initialMode = CaptureMode.qr,
    this.enableFlashToggle = true,
    this.enableCameraSwitch = true,
  });

  final CaptureMode initialMode;
  final bool enableFlashToggle;
  final bool enableCameraSwitch;

  @override
  State<SmartCameraScreen> createState() => _SmartCameraScreenState();
}

class _SmartCameraScreenState extends State<SmartCameraScreen>
    with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription> _cameras = const [];
  int _cameraIndex = 0; // default to first found (usually back)
  FlashMode _flashMode = FlashMode.off;
  CaptureMode _mode = CaptureMode.qr;
  bool _initializing = true;
  bool _isBusy = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _mode = widget.initialMode;
    _initCameras();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _reinitializeCurrentCamera();
    }
  }

  Future<void> _initCameras() async {
    try {
      setState(() {
        _initializing = true;
        _error = null;
      });
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() {
          _error = 'Không tìm thấy camera trên thiết bị.';
        });
        return;
      }
      _cameras = cameras;

      // Prefer back camera if present
      final backIndex = cameras.indexWhere(
            (c) => c.lensDirection == CameraLensDirection.back,
      );
      _cameraIndex = backIndex >= 0 ? backIndex : 0;

      await _startController(_cameras[_cameraIndex]);
    } catch (e) {
      setState(() => _error = 'Lỗi khởi tạo camera: $e');
    } finally {
      if (mounted) {
        setState(() => _initializing = false);
      }
    }
  }

  Future<void> _reinitializeCurrentCamera() async {
    if (_cameras.isEmpty) return;
    await _startController(_cameras[_cameraIndex]);
  }

  Future<void> _startController(CameraDescription description) async {
    final previous = _controller;
    _controller = CameraController(
      description,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    try {
      await _controller!.initialize();
      _flashMode = FlashMode.off;
      await _controller!.setFlashMode(_flashMode);
    } on CameraException catch (e) {
      setState(() =>
      _error = 'CameraException: ${e.code} ${e.description ?? ''}');
    } finally {
      await previous?.dispose();
      if (mounted) setState(() {});
    }
  }

  Future<void> _toggleCamera() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    final lensDirection = _controller!.description.lensDirection;
    CameraDescription newDescription;

    if (lensDirection == CameraLensDirection.front) {
      newDescription = cameras.firstWhere(
            (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
    } else {
      newDescription = cameras.firstWhere(
            (c) => c.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );
    }

    await _controller?.dispose();
    _controller = CameraController(newDescription, ResolutionPreset.high);
    await _controller?.initialize();
    if (mounted) setState(() {});
  }

  Future<void> _cycleFlashMode() async {
    final controller = _controller;
    if (controller == null) return;

    FlashMode next;
    switch (_flashMode) {
      case FlashMode.off:
        next = FlashMode.auto;
        break;
      case FlashMode.auto:
        next = FlashMode.always;
        break;
      case FlashMode.always:
        next = FlashMode.torch;
        break;
      case FlashMode.torch:
        next = FlashMode.off;
        break;
    }

    try {
      await controller.setFlashMode(next);
      setState(() => _flashMode = next);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Không hỗ trợ chế độ flash này: $e')),
        );
      }
    }
  }

  Future<void> _capture() async {
    if (_controller == null || !_controller!.value.isInitialized || _isBusy) return;

    setState(() => _isBusy = true);

    try {
      // Chụp ảnh gốc
      final rawFile = await _controller!.takePicture();
      final bytes = await File(rawFile.path).readAsBytes();

      // Decode ảnh
      final decoded = img.decodeImage(bytes);
      if (decoded == null) throw Exception("Không đọc được ảnh");

      final width = decoded.width;
      final height = decoded.height;

      // Crop dựa vào tỉ lệ trung tâm (cố định)
      late img.Image cropped;
      if (_mode == CaptureMode.cccd) {
        final rectWidth = (width * 0.9).toInt();
        final rectHeight = (rectWidth * 2 ~/ 3);
        final left = (width - rectWidth) ~/ 2;
        final top = (height - rectHeight) ~/ 2;
        cropped = img.copyCrop(decoded, left, top, rectWidth, rectHeight);
      } else {
        final size = (width * 0.8).toInt();
        final left = (width - size) ~/ 2;
        final top = (height - size) ~/ 2;
        cropped = img.copyCrop(decoded, left, top, size, size);
      }

      // Lưu file crop
      final newPath = rawFile.path.replaceFirst(RegExp(r'\.jpg$'), '_cropped.jpg');
      final croppedFile = File(newPath);
      await croppedFile.writeAsBytes(img.encodeJpg(cropped));

      // 💾 Lưu vào thư viện
      await GallerySaver.saveImage(croppedFile.path, albumName: "MyAppPhotos");

      if (!mounted) return;
      Navigator.of(context).pop(XFile(croppedFile.path));
    } catch (e) {
      if (mounted) {
        print('❌ Chụp/crop thất bại: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Chụp/crop thất bại: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final isFrontCamera =
        controller?.description.lensDirection == CameraLensDirection.front;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (_error != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _error!,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else if (_initializing ||
                controller == null ||
                !controller.value.isInitialized)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              _CameraPreviewWithOverlay(
                controller: controller,
                mode: _mode,
              ),

            // Top bar
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: Row(
                children: [
                  _CircleButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.of(context).maybePop(),
                    tooltip: 'Quay lại',
                  ),
                  const Spacer(),
                  SegmentedButton<CaptureMode>(
                    segments: const [
                      ButtonSegment(
                        value: CaptureMode.qr,
                        label: Text('QR'),
                        icon: Icon(Icons.qr_code_2),
                      ),
                      ButtonSegment(
                        value: CaptureMode.cccd,
                        label: Text('CCCD'),
                        icon: Icon(Icons.credit_card),
                      ),
                    ],
                    selected: {_mode},
                    onSelectionChanged: (s) {
                      setState(() => _mode = s.first);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Colors.black.withOpacity(0.4)),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      overlayColor: WidgetStateProperty.all(Colors.white10),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom controls
            Positioned(
              left: 0,
              right: 0,
              bottom: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.enableFlashToggle)
                    _CircleButton(
                      icon: _flashIcon(_flashMode),
                      onTap: isFrontCamera ? null : _cycleFlashMode,
                      tooltip: isFrontCamera
                          ? 'Flash không khả dụng ở camera trước'
                          : 'Flash: ${_flashLabel(_flashMode)}',
                    )
                  else
                    const SizedBox(width: 56, height: 56),

                  _ShutterButton(
                    onTap: _capture,
                    busy: _isBusy,
                  ),

                  if (widget.enableCameraSwitch && _cameras.length > 1)
                    _CircleButton(
                      icon: Icons.cameraswitch,
                      onTap: _toggleCamera,
                      tooltip: 'Đổi camera trước/sau',
                    )
                  else
                    const SizedBox(width: 56, height: 56),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static IconData _flashIcon(FlashMode mode) {
    switch (mode) {
      case FlashMode.off:
        return Icons.flash_off;
      case FlashMode.auto:
        return Icons.flash_auto;
      case FlashMode.always:
        return Icons.flash_on;
      case FlashMode.torch:
        return Icons.flashlight_on;
    }
  }

  static String _flashLabel(FlashMode mode) {
    switch (mode) {
      case FlashMode.off:
        return 'Tắt';
      case FlashMode.auto:
        return 'Tự động';
      case FlashMode.always:
        return 'Bật';
      case FlashMode.torch:
        return 'Đèn pin';
    }
  }
}

class _CameraPreviewWithOverlay extends StatelessWidget {
  const _CameraPreviewWithOverlay({
    required this.controller,
    required this.mode,
  });

  final CameraController controller;
  final CaptureMode mode;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          fit: StackFit.expand,
          children: [
            CameraPreview(controller),
            CustomPaint(
              painter: _CaptureGuidePainter(mode: mode),
              size: Size(constraints.maxWidth, constraints.maxHeight),
            ),
          ],
        );
      },
    );
  }
}

class _CaptureGuidePainter extends CustomPainter {
  _CaptureGuidePainter({required this.mode});

  final CaptureMode mode;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final overlay = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final double padding = 24;
    final double width = size.width - padding * 2;
    Rect guideRect;

    if (mode == CaptureMode.cccd) {
      final rectWidth = width * 0.9;
      final rectHeight = rectWidth * 0.6;
      final left = (size.width - rectWidth) / 2;
      final top = (size.height - rectHeight) / 2;
      guideRect = Rect.fromLTWH(left, top, rectWidth, rectHeight);
    } else {
      final square = width * 0.8;
      final left = (size.width - square) / 2;
      final top = (size.height - square) / 2;
      guideRect = Rect.fromLTWH(left, top, square, square);
    }

    final outer = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final inner = Path()..addRRect(RRect.fromRectXY(guideRect, 16, 16));
    final overlayPath = Path.combine(PathOperation.difference, outer, inner);
    canvas.drawPath(overlayPath, overlay);

    final corner = 28.0;
    final cornerPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawRRect(
        RRect.fromRectXY(guideRect, 16, 16),
        paint
          ..color = Colors.white70
          ..strokeWidth = 2);

    void drawCorner(double x, double y, bool horizontalRight, bool verticalDown) {
      final dx = horizontalRight ? corner : -corner;
      final dy = verticalDown ? corner : -corner;
      canvas.drawLine(Offset(x, y), Offset(x + dx, y), cornerPaint);
      canvas.drawLine(Offset(x, y), Offset(x, y + dy), cornerPaint);
    }

    drawCorner(guideRect.left, guideRect.top, true, true);
    drawCorner(guideRect.right, guideRect.top, false, true);
    drawCorner(guideRect.left, guideRect.bottom, true, false);
    drawCorner(guideRect.right, guideRect.bottom, false, false);

    final textPainter = TextPainter(
      text: TextSpan(
        text: mode == CaptureMode.qr ? 'Căn QR trong khung' : 'Căn CCCD trong khung',
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2, guideRect.bottom + 12),
    );
  }

  @override
  bool shouldRepaint(covariant _CaptureGuidePainter oldDelegate) =>
      oldDelegate.mode != mode;
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.icon,
    this.onTap,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback? onTap; // cho phép null để disable
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final btn = InkResponse(
      onTap: onTap,
      radius: 28,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white30),
        ),
        child: Icon(
          icon,
          color: onTap == null ? Colors.white24 : Colors.white,
        ),
      ),
    );
    return tooltip != null ? Tooltip(message: tooltip!, child: btn) : btn;
  }
}

class _ShutterButton extends StatelessWidget {
  const _ShutterButton({required this.onTap, required this.busy});

  final VoidCallback onTap;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: busy ? null : onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 6),
            ),
          ),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: busy ? Colors.white30 : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
