import 'package:auralys/shared/app_colors.dart';
import 'package:auralys/shared/app_sizes.dart';
import 'package:flutter/material.dart';

@immutable
class AppTheme {
  // Light Theme data
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.light.purple,
      // Utilise le purple comme couleur principale
      secondary: AppColors.light.secondary,
      primaryContainer: AppColors.light.primaryContainer,
      onPrimaryContainer: AppColors.light.onPrimaryContainer,
      surface: AppColors.light.background,
      onSurface: AppColors.light.onBackground,
      tertiary: AppColors
          .light
          .primary, // Garde l'ancienne couleur primaire comme tertiaire
    ),
    scaffoldBackgroundColor: AppColors.light.background,
    fontFamily: 'Urbanist',
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.light.purple,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    textTheme: TextTheme(
      titleLarge: headingSmExtraBold.copyWith(color: AppColors.light.primary),
      titleMedium: subtitleTheme,
      titleSmall: headingSmSemiBold,
      bodySmall: smallTextTheme,
      labelLarge: labelLarge,
      labelMedium: paragraphLg,
      labelSmall: labelSmall,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.light.purple,
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.padding,
          horizontal: AppSizes.doublePadding,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
      primary: AppColors.dark.purple,
      // Utilise le purple pour le dark mode aussi
      secondary: AppColors.dark.secondary,
      primaryContainer: AppColors.dark.primaryContainer,
      onPrimaryContainer: AppColors.dark.onPrimaryContainer,
      surface: AppColors.dark.background,
      onSurface: AppColors.dark.onBackground,
      tertiary: AppColors.dark.primary,
    ),
    scaffoldBackgroundColor: AppColors.dark.background,
    fontFamily: "Urbanist",
    textTheme: TextTheme(
      titleLarge: headingSmExtraBold,
      titleMedium: subtitleTheme.copyWith(color: AppColors.dark.onBackground),
      titleSmall: headingSmSemiBold.copyWith(
        color: AppColors.dark.onBackground,
      ),
      bodySmall: smallTextTheme.copyWith(
        color: AppColors.dark.onPrimaryContainer,
      ),
      labelLarge: labelLarge.copyWith(color: AppColors.dark.onPrimaryContainer),
      labelMedium: labelMedium.copyWith(color: AppColors.dark.onBackground),
      labelSmall: labelSmall.copyWith(color: AppColors.dark.onBackground),
      displayMedium: displayMedium.copyWith(color: AppColors.dark.onBackground),
      displaySmall: displaySmall,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.dark.purple,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1.4, color: AppColors.dark.onBackground),
      ),
    ),
  );

  // Text Styles
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

  // Heading Sm Styles
  static TextStyle headingSm = TextStyle(fontSize: AppSizes.font30);
  static TextStyle headingSmExtraBold = headingSm.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle headingSmBold = headingSm.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle headingSmSemiBold = headingSm.copyWith(
    fontWeight: FontWeight.w500,
  );

  // Heading Md Styles
  static TextStyle _headingMd = TextStyle(fontSize: AppSizes.font36);
  static TextStyle headingMdExtraBold = _headingMd.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle headingMdBold = _headingMd.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle headingMdSemiBold = _headingMd.copyWith(
    fontWeight: FontWeight.w500,
  );

  // Text Lg Styles
  static final TextStyle _textLg = TextStyle(fontSize: AppSizes.font18);
  static TextStyle textLgExtraBold = _textLg.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle textLgBold = _textLg.copyWith(fontWeight: FontWeight.w600);
  static TextStyle textLgSemiBold = _textLg.copyWith(
    fontWeight: FontWeight.w500,
  );

  // Text Md Styles
  static final TextStyle _textMd = TextStyle(fontSize: AppSizes.font14);
  static TextStyle textMdExtraBold = _textMd.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle textMdBold = _textMd.copyWith(fontWeight: FontWeight.w600);
  static TextStyle textMdSemiBold = _textMd.copyWith(
    fontWeight: FontWeight.w500,
  );

  // Text Sm Styles
  static TextStyle textSm = TextStyle(fontSize: AppSizes.font14);
  static TextStyle textSmExtraBold = textSm.copyWith(
    fontWeight: FontWeight.w700,
  );
  static TextStyle textSmBold = textSm.copyWith(fontWeight: FontWeight.w600);
  static TextStyle textSmSemiBold = textSm.copyWith(
    fontWeight: FontWeight.w500,
  );

  // Paragraph Styles
  static TextStyle paragraph = TextStyle(fontWeight: FontWeight.w400);
  static TextStyle paragraphXs = paragraph.copyWith(fontSize: AppSizes.font12);
  static TextStyle paragraphSm = paragraph.copyWith(fontSize: AppSizes.font14);
  static TextStyle paragraphMd = paragraph.copyWith(fontSize: AppSizes.font16);
  static TextStyle paragraphLg = paragraph.copyWith(fontSize: AppSizes.font18);
  static TextStyle paragraphXl = paragraph.copyWith(fontSize: AppSizes.font20);
  static TextStyle paragraph2Xl = paragraph.copyWith(fontSize: AppSizes.font24);

  // Label Styles
  static TextStyle label = TextStyle(fontWeight: FontWeight.w700);
  static TextStyle labelXs = label.copyWith(fontSize: AppSizes.font10);
  static TextStyle labelSm = label.copyWith(fontSize: AppSizes.font12);
  static TextStyle labelMd = label.copyWith(fontSize: AppSizes.font14);
  static TextStyle labelLg = label.copyWith(fontSize: AppSizes.font16);
  static TextStyle labelXl = label.copyWith(fontSize: AppSizes.font18);
  static TextStyle label2Xl = label.copyWith(fontSize: AppSizes.font20);

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
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
