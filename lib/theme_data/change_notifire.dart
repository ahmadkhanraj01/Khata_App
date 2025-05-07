import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class ChangeNotifireData extends ChangeNotifier {
  bool isDarkMode = false;
  String themeName = 'LightTheme';

  ChangeNotifireData() {
    _loadThemeState();
  }

  Future<void> _loadThemeState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('themeState') ?? false;
    themeName = isDarkMode ? 'DarkTheme' : 'LightTheme';
    notifyListeners();
  }
  void updateTheme(bool isDarkMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.isDarkMode = isDarkMode;
    themeName = isDarkMode ? 'DarkTheme' : 'LightTheme';
    await prefs.setBool('themeState', isDarkMode);
    print('is dark mode: $isDarkMode');
    notifyListeners();

  }
}
