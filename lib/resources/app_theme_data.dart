import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData defaultTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Unbounded',
        ),

      ),
    ),
    hoverColor: AppColors.accent,
    primaryColor: AppColors.primary,
    secondaryHeaderColor: AppColors.secondary,
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
      backgroundColor: Colors.transparent,
    )),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 38,
        fontWeight: FontWeight.w500,
        fontFamily: 'Unbounded',
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 34,
        fontWeight: FontWeight.w500,
        fontFamily: 'Unbounded',
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w500,
        fontFamily: 'Unbounded',
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.w500,
        fontFamily: 'Unbounded',
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'Unbounded',
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'Unbounded',
      ),

    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    useMaterial3: true,
  );
}

class AppColors {
  static const Color primary = Color(0xFFC983B7);
  static const Color primaryDark = Color(0xFF8F629A);
  static const Color primaryLight = Color(0xFFD3B1E0);
  static const Color secondary = Color(0xFF4BA6AE);
  static const Color secondaryDark = Color(0xFF204955);
  static const Color secondaryLight = Color(0xFF62D4DE);
  static const Color accent = Color(0xFFE7898B);
  static const Color accentDark = Color(0xFFC983B7);
  static const Color accentLight = Color(0xFFE7898B);
}
