import 'package:auralys/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets margin;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.margin = const EdgeInsets.only(top: 12),
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: AppTheme.textLgExtraBold),
            const SizedBox(width: 8),
            PhosphorIcon(PhosphorIconsRegular.arrowRight, size: 20),
          ],
        ),
      ),
    );
  }
}
