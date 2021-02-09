import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark;

  bool get isDark => _isDark;
  SharedPreferences _pref;
  String key = "themeKey";

  ThemeProvider() {
    _isDark = false;
    _loadFromPrefs();
  }

  void setThemeSwitch() {
    _isDark = !_isDark;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _isDark = _pref.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, isDark);
  }

  clearPrefs() async {
    await _initPrefs();
    _pref.clear();
  }
}
