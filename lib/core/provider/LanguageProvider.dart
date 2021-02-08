import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  String _selectedLanguage;

  String get selectedLanguage => _selectedLanguage;
  SharedPreferences _pref;
  String key = "languageKey";

  LanguageProvider() {
    _selectedLanguage = "en";
    _loadFromPrefs();
  }

  void setSelectedLanguage(String value) {
    _selectedLanguage = value;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _selectedLanguage = _pref.getString(key) ?? "en";
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setString(key, selectedLanguage);
  }

  clearPrefs() async {
    await _initPrefs();
    _pref.clear();
  }
}
