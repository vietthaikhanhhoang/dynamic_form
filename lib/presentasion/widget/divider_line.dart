import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({super.key, this.height = 1, this.color});

  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color:
          color ??
          Theme.of(context).colorScheme.outline.withValues(alpha: 0.12),
    );
  }
}
