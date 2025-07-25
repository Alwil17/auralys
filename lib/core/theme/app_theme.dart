import 'package:flutter/material.dart';

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: AppColors.accent,
    width: 1,
  ),
);

const errorInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: AppColors.error,
    width: 1,
  ),
);

// dark theme
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black12,
  primaryColor: AppColors.accent,
  hintColor: AppColors.secondaryAccent,
  fontFamily: 'Urbanist',
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColors.primaryText, fontSize: 32, fontWeight: FontWeight.bold),
    titleLarge:   TextStyle(color: AppColors.primaryText, fontSize: 20),
    bodyLarge:    TextStyle(color: AppColors.primaryText, fontSize: 16),
    bodyMedium:   TextStyle(color: AppColors.primaryText, fontSize: 14),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.darkBackground,
    elevation: 1,
    shape: CircularNotchedRectangle(),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.accent,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.black26,
    iconTheme: IconThemeData(color: AppColors.primaryText),
    titleTextStyle: TextStyle(color: AppColors.primaryText, fontSize: 20),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.accent,
    foregroundColor: AppColors.primaryText,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF1E1E1E),
    errorStyle: TextStyle(height: 0),
    border: defaultInputBorder,
    enabledBorder: defaultInputBorder,
    focusedBorder: defaultInputBorder,
    errorBorder: errorInputBorder,
    labelStyle: TextStyle(color: Colors.white70, fontSize: 13),
    hintStyle: TextStyle(color: Colors.white54),
  ),
);

// light theme
final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.primaryBackground,
  primaryColor: AppColors.accent,
  hintColor: AppColors.secondaryAccent,
  fontFamily: 'Urbanist',
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColors.secondaryBackground, fontSize: 32, fontWeight: FontWeight.bold),
    titleLarge:   TextStyle(color: AppColors.secondaryBackground, fontSize: 20),
    bodyLarge:    TextStyle(color: AppColors.secondaryBackground, fontSize: 16),
    bodyMedium:   TextStyle(color: AppColors.secondaryBackground, fontSize: 14),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.accent,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: AppColors.primaryText),
    titleTextStyle: TextStyle(color: AppColors.darkBackground, fontSize: 20),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
    elevation: 1,
    shape: CircularNotchedRectangle(),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.accent,
    foregroundColor: AppColors.primaryText,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    errorStyle: TextStyle(height: 0),
    border: defaultInputBorder,
    enabledBorder: defaultInputBorder,
    focusedBorder: defaultInputBorder,
    errorBorder: errorInputBorder,
    labelStyle: TextStyle(color: Color(0xff3A3A3B), fontSize: 13),
    hintStyle: TextStyle(color: Colors.grey),
  ),
);

class AppColors {
  static const Color primaryBackground = Color(0xFFFFFFFF);
  static const Color secondaryBackground = Color(0xFF2C3E50);
  static const Color primaryText = Color(0xFFF5F5F5);
  static const Color accent = Color(0xFFFABE17);
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color secondaryAccent = Color(0xFF7E57C2);
  static const Color vectorsBackground = Color(0xFFBB86FC);
  static const Color darkBackground = Color(0xFF171712);
  static const Color blueColor = Colors.blue;
}