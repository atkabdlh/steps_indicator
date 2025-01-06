import 'package:flutter/material.dart';

class SelectedIndicator extends StatelessWidget {
  const SelectedIndicator({
    super.key,
    this.backgroundColor,
    this.indicatorColor,
  });

  final Color? backgroundColor;
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: (110 - 24) * 0.5),
      child: Container(
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
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: indicatorColor ?? Color(0xFF005BFF),
            ),
          ),
        ),
      ),
    );
  }
}
