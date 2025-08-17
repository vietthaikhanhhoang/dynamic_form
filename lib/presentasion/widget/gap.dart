import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap({super.key, required this.gap});

  final double gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: gap);
  }
}
