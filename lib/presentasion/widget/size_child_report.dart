import 'package:flutter/material.dart';

class SizeReportInner extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChange;

  const SizeReportInner({
    super.key,
    required this.child,
    required this.onSizeChange,
  });

  @override
  State<SizeReportInner> createState() => _SizeReportInnerState();
}

class _SizeReportInnerState extends State<SizeReportInner> {
  Size? _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());

    return widget.child;
  }

  void _notifySize() {
    if (!mounted) {
      return;
    }
    final size = context.size;

    if (_oldSize != size && size != null) {
      _oldSize = size;
      widget.onSizeChange(size);
    }
  }
}

class SizeChildReportWidget extends StatelessWidget {
  const SizeChildReportWidget({
    super.key,
    required this.onSizeChange,
    required this.child,
    this.minHeight,
  });

  final ValueChanged<Size> onSizeChange;
  final Widget child;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minHeight: minHeight ?? 0,
      maxHeight: double.infinity,
      child: SizeReportInner(
        onSizeChange: onSizeChange,
        child: child,
      ),
    );
  }
}
