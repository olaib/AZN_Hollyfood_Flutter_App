import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  static const THEME_STATE_KEY = 'THEME_STATE';

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    setTheme(isDarkMode: _isDarkMode);
    notifyListeners();
  }


  ThemeProvider() {
    getTheme();
  }

  Future<SharedPreferences> getSharedPref() async => await SharedPreferences.getInstance();

  Future<void> setTheme({required bool isDarkMode}) async {
    SharedPreferences pref = await getSharedPref();
    pref.setBool(THEME_STATE_KEY, isDarkMode);
    _isDarkMode = isDarkMode;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences pref = await getSharedPref();
    _isDarkMode = pref.getBool(THEME_STATE_KEY) ?? false;
    notifyListeners();
    return _isDarkMode;
  }
}