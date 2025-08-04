import 'package:flutter/material.dart';

class CustomSliderThumbShape extends SliderComponentShape {
  final double enabledThumbRadius;
  final ThemeData theme;

  const CustomSliderThumbShape({
    required this.enabledThumbRadius,
    required this.theme,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(enabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    
    // Outer circle (shadow/border effect)
    final outerPaint = Paint()
      ..color = theme.colorScheme.primary.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, enabledThumbRadius + 4, outerPaint);
    
    // Main thumb circle
    final thumbPaint = Paint()
      ..color = theme.colorScheme.primary
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, enabledThumbRadius, thumbPaint);
    
    // Inner highlight
    final innerPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, enabledThumbRadius * 0.5, innerPaint);
    
    // Sleep icon
    final iconPainter = TextPainter(
      text: TextSpan(
        text: '🌙',
        style: TextStyle(
          fontSize: enabledThumbRadius * 0.8,
        ),
      ),
      textDirection: textDirection,
    );
    iconPainter.layout();
    iconPainter.paint(
      canvas,
      center - Offset(iconPainter.width / 2, iconPainter.height / 2),
    );
  }
}

class SleepVerticalSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  
  const SleepVerticalSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return RotatedBox(
      quarterTurns: -1,
      child: SizedBox(
        height: 60,
        child: SliderTheme(
          data: SliderThemeData(
            trackHeight: 8,
            thumbShape: CustomSliderThumbShape(
              enabledThumbRadius: 16,
              theme: theme,
            ),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
            activeTrackColor: theme.colorScheme.primary,
            inactiveTrackColor: theme.colorScheme.primary.withValues(alpha: 0.2),
            thumbColor: theme.colorScheme.primary,
            overlayColor: theme.colorScheme.primary.withValues(alpha: 0.1),
          ),
          child: Slider(
            value: value,
            min: 0,
            max: 4,
            divisions: 4,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
