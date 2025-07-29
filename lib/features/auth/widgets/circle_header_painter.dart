import 'package:flutter/material.dart';

class CircleHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE876DB)
      ..style = PaintingStyle.fill;

    // Draw circle positioned to create the header effect
    canvas.drawCircle(
      Offset(size.width / 2, -320),
      480,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}