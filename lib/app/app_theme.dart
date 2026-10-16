import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get light {
    const purple = Color(0xFF7C3AED);
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: purple,
          brightness: Brightness.light,
        ).copyWith(
          primary: purple,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: const Color(0xFF241348),
          onSurfaceVariant: const Color(0xFF70628F),
        );
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFFDED5F0)),
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFF7F2FF),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: purple, width: 2),
        ),
        hintStyle: const TextStyle(color: Color(0xFF9C90B8)),
        prefixIconColor: const Color(0xFF80709F),
        suffixIconColor: const Color(0xFF80709F),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 17,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: purple,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(56),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
