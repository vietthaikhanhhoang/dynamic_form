import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:intl/intl.dart';
import 'package:image/image.dart' as img_lib;
import 'dart:ui' as ui;

class PrintPage extends StatefulWidget {
  const PrintPage({super.key});

  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  bool isPrinting = false;
  bool isPrintError = false;

  void setPrinting(bool v) => setState(() => isPrinting = v);
  void setPrintError(bool v) => setState(() => isPrintError = v);

  @override
  Widget build(BuildContext context) {
    void onExit() {
      if (context.mounted) Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Phiếu")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _printReceipt(
                  printerIp: "10.10.2.75",
                  onPrintSuccess: onExit,
                  onPrintError: (err) {
                    debugPrint("Lỗi in: $err");
                    setPrintError(true);
                  },
                  onLoading: setPrinting,
                );
                debugPrint('print done');
              },
              child: const Text("In đi"),
            ),
            if (isPrinting)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            if (isPrintError)
              const Text("Lỗi in!", style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  Future<void> _printReceipt({
    required String printerIp,
    Function? onPrintSuccess,
    Function(String)? onPrintError,
    required Function(bool) onLoading,
  }) async {
    onLoading(true);
    setPrintError(false);

    try {
      final port = 9100;
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);

      final res = await printer.connect(printerIp, port: port);
      if (res != PosPrintResult.success) {
        throw Exception('Không thể kết nối máy in: $res');
      }

      final now = DateTime.now();
      final dateStr = DateFormat('dd/MM/yyyy').format(now);
      final timeStr = DateFormat('H:mm').format(now);

      final canvasWidth = 576; // chuẩn 80mm giấy, px

      final List<TextPainter> painters = [
        _createTextPainter(
          'VNPT',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          canvasWidth: canvasWidth,
        ),
        _createTextPainter(
          '270 Lý Thường Kiệt, P. Diên Hồng, TP.HCM',
          fontSize: 27,
          canvasWidth: canvasWidth,
        ),
        _createTextPainter('', fontSize: 20, canvasWidth: canvasWidth),
        _createTextPainter(
          'Dịch vụ yêu cầu',
          fontSize: 27,
          canvasWidth: canvasWidth,
        ),
        _createTextPainter(
          'THAY ĐỔI THÔNG TIN THUÊ BAO',
          fontSize: 27,
          canvasWidth: canvasWidth,
        ),
        _createTextPainter(
          '01',
          fontSize: 128,
          fontWeight: FontWeight.bold,
          canvasWidth: canvasWidth,
        ),
        _createTextPainter(dateStr, fontSize: 27, canvasWidth: canvasWidth),
        _createTextPainter(timeStr, fontSize: 27, canvasWidth: canvasWidth),
        _createTextPainter('', fontSize: 20, canvasWidth: canvasWidth),
        _createTextPainter(
          'Mời quý khách quét mã tải app My VNPT',
          fontSize: 27,
          canvasWidth: canvasWidth,
        ),
        _createTextPainter(
          'để có thêm nhiều trải nghiệm hơn!',
          fontSize: 27,
          canvasWidth: canvasWidth,
        ),
        _createTextPainter(
          'https://vnpt.com.vn',
          fontSize: 16,
          color: Colors.blue,
          canvasWidth: canvasWidth,
        ),
      ];

      double totalHeight = painters.fold(0, (sum, tp) => sum + tp.height);

      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, canvasWidth.toDouble(), totalHeight));

      final bgPaint = Paint()..color = Colors.white;
      canvas.drawRect(Rect.fromLTWH(0, 0, canvasWidth.toDouble(), totalHeight), bgPaint);

      double yOffset = 0;
      for (final tp in painters) {
        final dx = (canvasWidth - tp.width) / 2;
        tp.paint(canvas, Offset(dx, yOffset));
        yOffset += tp.height;
      }

      final picture = recorder.endRecording();
      final img = await picture.toImage(canvasWidth, totalHeight.ceil());

      final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) throw Exception('Không thể chuyển ảnh sang bytes');

      final imageBytes = byteData.buffer.asUint8List();
      final imageForPrinter = img_lib.decodePng(imageBytes);
      if (imageForPrinter == null) throw Exception('Giải mã ảnh thất bại');

      printer.image(imageForPrinter);

      printer.feed(1);
      printer.qrcode("https://vnpt.com.vn", size: QRSize.Size8, align: PosAlign.center);
      printer.feed(1);

      final thankYouPainter = _createTextPainter(
        'Cảm ơn quý khách đã sử dụng dịch vụ!',
        fontSize: 27,
        canvasWidth: canvasWidth,
      );

      final recorder2 = ui.PictureRecorder();
      final canvas2 = Canvas(recorder2, Rect.fromLTWH(0, 0, canvasWidth.toDouble(), thankYouPainter.height));
      canvas2.drawRect(Rect.fromLTWH(0, 0, canvasWidth.toDouble(), thankYouPainter.height), bgPaint);
      final dx2 = (canvasWidth - thankYouPainter.width) / 2;
      thankYouPainter.paint(canvas2, Offset(dx2, 0));
      final picture2 = recorder2.endRecording();
      final img2 = await picture2.toImage(canvasWidth, thankYouPainter.height.ceil());
      final byteData2 = await img2.toByteData(format: ui.ImageByteFormat.png);
      if (byteData2 == null) throw Exception('Không thể chuyển ảnh sang bytes');

      final imageBytes2 = byteData2.buffer.asUint8List();
      final imageThankYou = img_lib.decodePng(imageBytes2);
      if (imageThankYou == null) throw Exception('Giải mã ảnh thất bại');

      printer.image(imageThankYou);

      printer.cut();
      printer.disconnect();

      onLoading(false);
      if (onPrintSuccess != null) onPrintSuccess();
    } catch (e) {
      debugPrint("Lỗi in trong catch: $e");
      onLoading(false);
      if (onPrintError != null) onPrintError(e.toString());
    }
  }

  TextPainter _createTextPainter(
      String text, {
        double fontSize = 16,
        FontWeight fontWeight = FontWeight.normal,
        Color color = Colors.black,
        required int canvasWidth,
      }) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: 'Roboto',
        ),
      ),
      textDirection: ui.TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    tp.layout(maxWidth: canvasWidth.toDouble());
    return tp;
  }
}
