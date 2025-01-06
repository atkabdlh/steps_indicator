import 'package:flutter/material.dart';

class NormalIndicator extends StatelessWidget {
  const NormalIndicator({
    super.key,
    this.borderColor,
    this.backgroundColor,
  });

  final Color? borderColor;
  final Color? backgroundColor;

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
            color: borderColor ?? Color(0xFFC7C7C7),
            width: 1.4,
          ),
        ),
      ),
    );
  }
}
