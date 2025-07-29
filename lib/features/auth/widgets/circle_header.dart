import 'package:flutter/material.dart';

class CircleHeader extends StatelessWidget {
  const CircleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 200,
      child: CustomPaint(
        painter: CircleHeaderPainter(
          color: Theme.of(context).colorScheme.primary, // Utilise la couleur purple du thème
        ),
        size: Size(MediaQuery.of(context).size.width, 200),
      ),
    );
  }
}

class CircleHeaderPainter extends CustomPainter {
  final Color color;

  CircleHeaderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, -320),
      480,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
