import 'package:flutter/material.dart';

class CenterWithConstraint extends StatefulWidget {
  final Widget? child;
  final double? heightMinus;
  final double padding;

  const CenterWithConstraint({
    super.key,
    this.child,
    this.heightMinus,
    required this.padding,
  });

  @override
  State<CenterWithConstraint> createState() => _CenterWithConstraintState();
}

class _CenterWithConstraintState extends State<CenterWithConstraint> {
  double remainingHeight = 0;
  final GlobalKey widgetKey = GlobalKey();
  // Thêm biến trạng thái để quản lý opacity
  bool _isCalculated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      final RenderBox? box =
          widgetKey.currentContext?.findRenderObject() as RenderBox?;

      if (box != null) {
        final widgetHeight = box.size.height;
        setState(() {
          remainingHeight =
              screenSize.height -
              widgetHeight -
              (widget.heightMinus != null ? widget.heightMinus! * 2 : 0);
          // Đặt trạng thái đã tính toán xong
          _isCalculated = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng AnimatedOpacity để tạo hiệu ứng chuyển đổi mượt mà
    return AnimatedOpacity(
      // Opacity sẽ là 1.0 khi đã tính toán xong, ngược lại là 0.0
      opacity: _isCalculated ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 60),
      child: Padding(
        padding: EdgeInsets.only(
          top:
              remainingHeight > 0 && (remainingHeight / 2 > widget.padding)
                  ? remainingHeight / 2
                  : widget.padding,
        ),
        key: widgetKey,
        child: widget.child,
      ),
    );
  }
}
