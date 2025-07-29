import 'package:flutter/material.dart';

class MoodPainter extends CustomPainter {
  final Color color;
  
  MoodPainter({required this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const archWidth = 20.0;
    final path = Path();

    // Start at top-left
    path.moveTo(archWidth, 0);

    // Top edge
    path.lineTo(size.width - archWidth, 0);

    // Right arch
    path.quadraticBezierTo(
      size.width - archWidth * 2 - 10,
      size.height / 2,
      size.width - archWidth,
      size.height,
    );
    
    // Bottom edge
    path.lineTo(archWidth, size.height);

    // Left arch
    path.quadraticBezierTo(archWidth / 2 - 22, size.height / 2, archWidth, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
