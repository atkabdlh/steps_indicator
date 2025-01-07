import 'package:flutter/material.dart';

class NormalIndicator extends StatelessWidget {
  const NormalIndicator({
    super.key,
    this.borderColor,
    this.backgroundColor,
    this.height,
  });

  final Color? borderColor;
  final Color? backgroundColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.white,
        border: Border.all(
          color: borderColor ?? Color(0xFFC7C7C7),
          width: 1.4,
        ),
      ),
    );
  }
}
