import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const light = _LightColors();

  // Dark Theme Colors
  static const dark = _DarkColors();
}

class _DarkColors {
  const _DarkColors();

  Color get background => const Color(0xFF251404);
  Color get onBackground => const Color(0xFFFFFFFF);
  Color get onPrimaryContainer => const Color(0xFFC9C7C5);
  Color get primary => const Color(0xFF926247);
  Color get primaryContainer => const Color(0xFF372315);
  Color get secondary => const Color(0xFF9db068);
}

class _LightColors {
  const _LightColors();

  Color get background => const Color(0xFFFFFAF4);
  Color get onBackground => const Color(0xFF4F3422);
  Color get onPrimaryContainer => const Color(0xFF736B66);
  Color get primary => const Color(0xFF4F3422);
  Color get primaryContainer => const Color(0xFFFFFFFF);
  Color get secondary => const Color(0xFF9db068);
}