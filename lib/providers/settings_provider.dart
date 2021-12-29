import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  SharedPreferences? _prefs;

  Future<bool> get isDarkMode async {
    var prefs = await _getPrefs;
    return prefs.getBool('isDarkMode') ?? false;
  }

  void setDarkMode(bool value) async {
    var prefs = await _getPrefs;
    prefs.setBool('isDarkMode', value);
    notifyListeners();
  }

  Future<SharedPreferences> get _getPrefs async =>
      _prefs ??= await SharedPreferences.getInstance();
}
