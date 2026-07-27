import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dialogTheme: const DialogThemeData(
      backgroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: Color(0xFF395CBC),
      secondary: Color(0xFF1A2A56),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dialogTheme: const DialogThemeData(
      backgroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: Color(0xFF395CBC),
      secondary: Color(0xFF1A2A56),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
  );
}
