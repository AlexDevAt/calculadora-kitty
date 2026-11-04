import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveThemePreferences(bool isDark) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("isDarkMode", isDark);
}

Future<void> saveSoundPreferences(bool isActiveSound) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("isSoundEnable", isActiveSound);
}

Future<bool> loadThemePreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool("isDarkMode") ?? false;
}

Future<bool> loadSoundPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("isSoundEnable") ?? false;
}
