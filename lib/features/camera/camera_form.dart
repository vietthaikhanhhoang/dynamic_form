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
    this.saveToGallery = true,
  });

  final CaptureMode initialMode;
  final bool enableFlashToggle;
  final bool enableCameraSwitch;
  final bool saveToGallery;

  @override
  State<SmartCameraScreen> createState() => _SmartCameraScreenState();
}

class _SmartCameraScreenState extends State<SmartCameraScreen>
    with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _cameraIndex = 0;
  FlashMode _flashMode = FlashMode.off;
  CaptureMode _mode = CaptureMode.qr;
  bool _isBusy = false;
  bool _initializing = true;
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
    if (controller == null || !controller.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _reinitializeCurrentCamera();
    }
  }

  Future<void> _initCameras() async {
    try {
      setState(() => _initializing = true);
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() => _error = "Không tìm thấy camera.");
        return;
      }
      _cameras = cameras;
      _cameraIndex = cameras.indexWhere(
              (c) => c.lensDirection == CameraLensDirection.back);
      if (_cameraIndex < 0) _cameraIndex = 0;
      await _startController(_cameras[_cameraIndex]);
    } catch (e) {
      setState(() => _error = "Lỗi khởi tạo camera: $e");
    } finally {
      setState(() => _initializing = false);
    }
  }

  Future<void> _reinitializeCurrentCamera() async {
    if (_cameras.isEmpty) return;
    await _startController(_cameras[_cameraIndex]);
  }

  Future<void> _startController(CameraDescription description) async {
    // Dispose controller cũ
    if (_controller != null) {
      try {
        await _controller!.dispose();
      } catch (_) {}
    }

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
      if (mounted) setState(() {}); // cập nhật UI
    } catch (e) {
      if (mounted) setState(() => _error = 'Camera init lỗi: $e');
    }
  }

  Future<void> _toggleCamera() async {
    if (_cameras.length < 2) return; // Không có camera thứ 2
    _cameraIndex = (_cameraIndex + 1) % _cameras.length;
    await _startController(_cameras[_cameraIndex]);
  }

  Future<void> _cycleFlashMode() async {
    if (_controller == null) return;
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
      await _controller!.setFlashMode(next);
      setState(() => _flashMode = next);
    } catch (_) {}
  }

  Future<void> _capture() async {
    if (_controller == null || !_controller!.value.isInitialized || _isBusy) return;

    setState(() => _isBusy = true);

    try {
      final rawFile = await _controller!.takePicture();
      final bytes = await File(rawFile.path).readAsBytes();
      final decoded = img.decodeImage(bytes);
      if (decoded == null) throw Exception("Không đọc được ảnh");

      // Lấy size preview
      final previewSize = _controller!.value.previewSize!;
      final guideRect = _currentGuideRect(previewSize, _mode);

      // Crop ảnh theo guideRect
      final cropped = _cropWithGuide(decoded, previewSize, guideRect);

      final newPath = rawFile.path.replaceFirst(RegExp(r'\.jpg$'), '_cropped.jpg');
      final croppedFile = File(newPath);
      await croppedFile.writeAsBytes(img.encodeJpg(cropped));

      if (widget.saveToGallery) {
        await GallerySaver.saveImage(croppedFile.path, albumName: "MyAppPhotos");
      }

      if (!mounted) return;
      Navigator.of(context).pop(XFile(croppedFile.path));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('❌ Chụp/crop thất bại: $e')));
      }
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

// Tạo guideRect trên preview (theo mode)
  Rect _currentGuideRect(Size previewSize, CaptureMode mode) {
    final double padding = 24;
    final double width = previewSize.width - padding * 2;

    if (mode == CaptureMode.cccd) {
      final rectWidth = width * 0.9;
      final rectHeight = rectWidth * 0.6; // CCCD: chữ nhật
      final left = (previewSize.width - rectWidth) / 2;
      final top = (previewSize.height - rectHeight) / 2;
      return Rect.fromLTWH(left, top, rectWidth, rectHeight);
    } else {
      final square = width * 0.8;
      final left = (previewSize.width - square) / 2;
      final top = (previewSize.height - square) / 2;
      return Rect.fromLTWH(left, top, square, square);
    }
  }

// Crop ảnh theo guideRect
  img.Image _cropWithGuide(
      img.Image original, Size previewSize, Rect guideRect) {
    final scaleX = original.width / previewSize.width;
    final scaleY = original.height / previewSize.height;

    final left = (guideRect.left * scaleX).toInt();
    final top = (guideRect.top * scaleY).toInt();
    final width = (guideRect.width * scaleX).toInt();
    final height = (guideRect.height * scaleY).toInt();

    return img.copyCrop(original, left, top, width, height);
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final isFront = controller?.description.lensDirection == CameraLensDirection.front;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            if (_error != null)
              Center(child: Text(_error!, style: const TextStyle(color: Colors.white)))
            else if (_initializing || controller == null || !controller.value.isInitialized)
              const Center(child: CircularProgressIndicator())
            else
              CameraPreviewWithOverlay(controller: controller!, mode: _mode),

            // Top bar
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: Row(
                children: [
                  _CircleButton(icon: Icons.arrow_back, onTap: () => Navigator.of(context).pop()),
                  const Spacer(),
                  SegmentedButton<CaptureMode>(
                    segments: const [
                      ButtonSegment(value: CaptureMode.qr, label: Text('QR'), icon: Icon(Icons.qr_code_2)),
                      ButtonSegment(value: CaptureMode.cccd, label: Text('CCCD'), icon: Icon(Icons.credit_card)),
                    ],
                    selected: {_mode},
                    onSelectionChanged: (s) => setState(() => _mode = s.first),
                  ),
                ],
              ),
            ),

            // Bottom controls
            Positioned(
              left: 0, right: 0, bottom: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.enableFlashToggle)
                    _CircleButton(icon: _flashIcon(_flashMode), onTap: isFront ? null : _cycleFlashMode)
                  else
                    const SizedBox(width: 56, height: 56),
                  _ShutterButton(onTap: _capture, busy: _isBusy),
                  if (widget.enableCameraSwitch && _cameras.length > 1)
                    _CircleButton(icon: Icons.cameraswitch, onTap: _toggleCamera)
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
      case FlashMode.off: return Icons.flash_off;
      case FlashMode.auto: return Icons.flash_auto;
      case FlashMode.always: return Icons.flash_on;
      case FlashMode.torch: return Icons.flashlight_on;
    }
  }
}

// ---------- UI Widgets ----------
class CameraPreviewWithOverlay extends StatelessWidget {
  const CameraPreviewWithOverlay({super.key, required this.controller, required this.mode});
  final CameraController controller;
  final CaptureMode mode;

  @override
  Widget build(BuildContext context) {
    final size = controller.value.previewSize!;
    final previewRatio = size.height / size.width;

    return Center(
        child: ClipRect(
            child: AspectRatio(
                aspectRatio: previewRatio,
                child: Stack(
                    children: [
                    CameraPreview(controller),
                LayoutBuilder(
                    builder: (context, constraints) {
                      return CustomPaint(
                        painter: CaptureGuidePainter(
                          mode: mode,
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                        ),
                      );
                    },
                ),
                    ],
                ),
            ),
        ),
    );
  }
}

class CaptureGuidePainter extends CustomPainter {
  CaptureGuidePainter({required this.mode, required this.width, required this.height});
  final CaptureMode mode;
  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white70
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Rect guideRect;
    if (mode == CaptureMode.cccd) {
      final w = width * 0.9;
      final h = w * 2 / 3;
      guideRect = Rect.fromLTWH((width - w) / 2, (height - h) / 2, w, h);
    } else {
      final s = width * 0.8;
      guideRect = Rect.fromLTWH((width - s) / 2, (height - s) / 2, s, s);
    }

    // Overlay
    final outer = Path()..addRect(Rect.fromLTWH(0, 0, width, height));
    final inner = Path()..addRect(guideRect);
    final overlayPath = Path.combine(PathOperation.difference, outer, inner);
    canvas.drawPath(overlayPath, overlayPaint);

    // Border + corners
    canvas.drawRect(guideRect, borderPaint);
    const cornerLength = 28.0;
    final cornerPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    void drawCorner(double x, double y, bool right, bool down) {
      final dx = right ? cornerLength : -cornerLength;
      final dy = down ? cornerLength : -cornerLength;
      canvas.drawLine(Offset(x, y), Offset(x + dx, y), cornerPaint);
      canvas.drawLine(Offset(x, y), Offset(x, y + dy), cornerPaint);
    }

    drawCorner(guideRect.left, guideRect.top, true, true);
    drawCorner(guideRect.right, guideRect.top, false, true);
    drawCorner(guideRect.left, guideRect.bottom, true, false);
    drawCorner(guideRect.right, guideRect.bottom, false, false);

    // Label
    final tp = TextPainter(
      text: TextSpan(
        text: mode == CaptureMode.qr ? 'Căn QR trong khung' : 'Căn CCCD trong khung',
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: width);

    tp.paint(canvas, Offset((width - tp.width) / 2, guideRect.bottom + 12));
  }

  @override
  bool shouldRepaint(covariant CaptureGuidePainter old) => old.mode != mode;
}

// ---------- Buttons ----------
class _CircleButton extends StatelessWidget {
  const _CircleButton({required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
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
        child: Icon(icon, color: onTap == null ? Colors.white24 : Colors.white),
      ),
    );
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
