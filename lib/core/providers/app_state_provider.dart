import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kLocale = "locale";

const String _kTheme = "is_dark_mode";
class AppStateProvider with ChangeNotifier {
  late SharedPreferences sharedPreferences;

  String _locale = "fr";
  bool _isDarkMode = false;

  // Initialize SharedPreferences
  AppStateProvider(this.sharedPreferences);
  bool get isDarkMode => _isDarkMode;


  set isDarkMode(bool state) {
    _setBool(_kTheme, state);
    _isDarkMode = state;
  }

  // Getters
  String get locale => _locale;
  set locale(String state) {
    _setString(_kLocale, state);
    _locale = state;
  }

  // Load preferences from SharedPreferences at startup
  Future<void> clear() async {
    // Use jsonDecode for user data stored in SharedPreferences
    await sharedPreferences.clear();

    notifyListeners();
  }

  // Load preferences from SharedPreferences at startup
  Future<void> loadPreferences() async {
    // Use jsonDecode for user data stored in SharedPreferences
    _locale = sharedPreferences.getString(_kLocale) ?? "fr";
    _isDarkMode = sharedPreferences.getBool(_kTheme) ?? false;

    notifyListeners();
  }

  Future<void> _setBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
    notifyListeners();
  }

  // Generic methods for storing data in SharedPreferences
  Future<void> _setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
    notifyListeners();
  }

}