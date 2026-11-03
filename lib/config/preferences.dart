import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveThemePreferences(bool isDark) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("isDarkMode", isDark);
}

Future<bool> loadThemePreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool("isDarkMode") ?? false;
}
