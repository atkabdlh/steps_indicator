import 'package:flutter/material.dart';

class SelectedIndicator extends StatelessWidget {
  const SelectedIndicator({
    super.key,
    this.height,
    this.backgroundColor,
    this.indicatorColor,
  });

  final double? height;
  final Color? backgroundColor;
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.white,
        border: Border.all(
          color: indicatorColor ?? Color(0xFF005BFF),
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: indicatorColor ?? Color(0xFF005BFF),
          ),
        ),
      ),
    );
  }
}
