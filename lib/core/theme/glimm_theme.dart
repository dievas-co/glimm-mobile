import 'package:flutter/material.dart';

abstract final class GlimmColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey900 = Color(0xFF212121);
  static const Color error = Color(0xFFE53935);
}

abstract final class GlimmTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: GlimmColors.white,
    colorScheme: const ColorScheme.light(
      primary: GlimmColors.black,
      onPrimary: GlimmColors.white,
      secondary: GlimmColors.grey700,
      onSecondary: GlimmColors.white,
      surface: GlimmColors.white,
      onSurface: GlimmColors.black,
      error: GlimmColors.error,
      onError: GlimmColors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: GlimmColors.white,
      foregroundColor: GlimmColors.black,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: GlimmColors.black,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: GlimmColors.black,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: GlimmColors.black),
      bodyMedium: TextStyle(color: GlimmColors.grey700),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: GlimmColors.black,
        foregroundColor: GlimmColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: GlimmColors.black, width: 2),
      ),
    ),
    dividerTheme: const DividerThemeData(color: GlimmColors.grey300),
  );
}
