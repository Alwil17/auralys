import 'package:auralys/shared/app_colors.dart';
import 'package:auralys/shared/app_sizes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme data
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.light.primary,
      secondary: AppColors.light.secondary,
      primaryContainer: AppColors.light.primaryContainer,
      onPrimaryContainer: AppColors.light.onPrimaryContainer,
      surface: AppColors.light.background,
      onSurface: AppColors.light.onBackground,
    ),
    scaffoldBackgroundColor: AppColors.light.background,
    fontFamily: 'Urbanist',
    textTheme: TextTheme(
      titleLarge: titleTheme.copyWith(color: AppColors.light.primary),
      titleMedium: subtitleTheme,
      titleSmall: titleSmallTheme,
      bodySmall: smallTextTheme,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.light.primaryContainer,
        backgroundColor: AppColors.light.primary,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.light.onBackground),
      ),
    ),
  );

  // Dark Theme data
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.dark.primary,
      secondary: AppColors.dark.secondary,
      primaryContainer: AppColors.dark.primaryContainer,
      onPrimaryContainer: AppColors.dark.onPrimaryContainer,
      surface: AppColors.dark.background,
      onSurface: AppColors.dark.onBackground,
    ),
    scaffoldBackgroundColor: AppColors.dark.background,
    fontFamily: "Urbanist",
    textTheme: TextTheme(
      titleLarge: titleTheme,
      titleMedium: subtitleTheme.copyWith(
        color: AppColors.dark.onBackground,
      ),
      titleSmall: titleSmallTheme.copyWith(
        color: AppColors.dark.onBackground,
      ),
      bodySmall: smallTextTheme.copyWith(
        color: AppColors.dark.onPrimaryContainer,
      ),
      labelLarge: labelLarge.copyWith(
        color: AppColors.dark.onPrimaryContainer,
      ),
      labelMedium: labelMedium.copyWith(color: AppColors.dark.onBackground),
      labelSmall: labelSmall.copyWith(color: AppColors.dark.onBackground),
      displayMedium: displayMedium.copyWith(
        color: AppColors.dark.onBackground,
      ),
      displaySmall: displaySmall,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.dark.onBackground,
        backgroundColor: AppColors.dark.primary,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1.4, color: AppColors.dark.onBackground),
      ),
    ),
  );

  // Text Styles
  static const TextStyle titleTheme = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: AppSizes.title,
  );
  static TextStyle titleSmallTheme = TextStyle(
    color: AppColors.light.primary,
    fontWeight: FontWeight.w800,
    fontSize: AppSizes.titleSmall,
  );
  static TextStyle subtitleTheme = TextStyle(
    color: AppColors.light.onPrimaryContainer,
    fontWeight: FontWeight.w500,
    fontSize: AppSizes.subTitle,
  );
  static TextStyle displayMedium = TextStyle(
    color: AppColors.light.primary,
    fontWeight: FontWeight.w700,
    fontSize: AppSizes.displayMedium,
  );
  static TextStyle displaySmall = TextStyle(
    color: AppColors.light.primaryContainer,
    fontWeight: FontWeight.w700,
    fontSize: AppSizes.buttonText,
  );
  static TextStyle smallTextTheme = TextStyle(
    color: AppColors.light.onPrimaryContainer,
    fontWeight: FontWeight.w700,
    fontSize: AppSizes.smallText,
  );
  static TextStyle labelLarge = TextStyle(
    color: AppColors.light.onPrimaryContainer,
    fontWeight: FontWeight.w700,
    fontSize: AppSizes.subTitle - 1,
  );
  static TextStyle labelMedium = TextStyle(
    color: AppColors.light.onBackground,
    fontWeight: FontWeight.w700,
    fontSize: AppSizes.smallText2,
  );
  static TextStyle labelSmall = TextStyle(
    color: AppColors.light.onBackground,
    fontWeight: FontWeight.w800,
    fontSize: AppSizes.smallText,
  );
  static ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );
  static ButtonStyle circularOutlinedButtonStyle = outlinedButtonStyle.copyWith(
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    ),
  );
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      vertical: AppSizes.padding,
      horizontal: AppSizes.doublePadding,
    ),
  );
  static ButtonStyle circularElevatedButtonStyle = elevatedButtonStyle.copyWith(
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppSizes.doublePadding,
        horizontal: AppSizes.doublePadding,
      ),
    ),
  );
}
