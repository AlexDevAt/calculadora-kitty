import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: const Color(0xFFFFF0F5),

    colorScheme: const ColorScheme.light(
      primary: Color(0xFFF06292),
      secondary: Color(0xFFFFB6C1),
      surface: Color(0xFFFFFAFC),
      onPrimary: Colors.white,
      onSurface: Color(0xFF3D2630),
      outline: Color(0xFFF06292),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFF0F5),
      foregroundColor: Color(0xFF3D2630),
      centerTitle: true,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFFFFFAFC),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFFFD6E2)),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color(0xFF1C1D22),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFC9517C),
      secondary: Color(0xFFF15A8B),
      surface: Color(0xFF40323F),
      onPrimary: Colors.white,
      onSurface: Colors.white,
      outline: Color(0xFF725366),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1C1D22),
      foregroundColor: Color(0xFFFFF1F6),
      centerTitle: true,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF40323F),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFF725366)),
      ),
    ),
  );
}
