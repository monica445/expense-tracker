import 'package:flutter/material.dart';

class AppTheme {
  // 🎨 COLORS
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color lightBlue = Color(0xFF42A5F5);
  static const Color background = Color(0xFFF5F7FA);
  static const Color textDark = Color(0xFF1E1E1E);
  static const Color textGrey = Color(0xFF757575);
  static const Color expenseRed = Color(0xFFD32F2F);
  static const Color incomeGreen = Color(0xFF2E7D32);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // 🌈 MAIN COLORS
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: background,

    colorScheme: ColorScheme.light(
      primary: primaryBlue,
      secondary: lightBlue,
      error: expenseRed,
    ),

    // 🧾 APP BAR
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryBlue,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    // ✏️ TEXT THEME
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textDark,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: textDark),
      bodyMedium: TextStyle(fontSize: 14, color: textGrey),
    ),

    // 🔘 BUTTONS
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // 🧾 INPUT FIELDS
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryBlue, width: 2),
      ),
      labelStyle: const TextStyle(color: textGrey),
    ),

    // 📄 CARD STYLE
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
