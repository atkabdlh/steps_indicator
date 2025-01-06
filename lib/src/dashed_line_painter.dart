import 'package:flutter/material.dart';

class LineDashedPainter extends CustomPainter {
  LineDashedPainter({
    required this.color,
    required this.height,
    required this.width,
    this.thickness,
  });

  final Color color;
  final double height;
  final double width;
  final double? thickness;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = thickness ?? 4;
    var max = height;
    var dashWidth = 8;
    var dashSpace = 8;
    double startY = -(height * 0.5);
    double startX = 0;
    while (max >= 0) {
      canvas.drawLine(
          Offset(startX, startY), Offset(startX, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
