import 'package:flutter/material.dart';

class DismissKeyboard extends StatelessWidget {
  final Widget child;

  const DismissKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior:
          HitTestBehavior
              .opaque, //là cần thiết để vùng trống vẫn nhận được sự kiện chạm
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
