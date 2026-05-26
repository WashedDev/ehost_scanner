import 'package:flutter/material.dart';

class MachenjiColors {
  static const Color background = Color(0xFF090B12);
  static const Color surface = Color(0xFF111827);
  static const Color surfaceSoft = Color(0xFF1F2937);

  static const Color primary = Color(0xFFFF7A00);
  static const Color primaryDark = Color(0xFFC95700);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  static const Color text = Color(0xFFF9FAFB);
  static const Color textMuted = Color(0xFFA7B0C0);
  static const Color border = Color(0xFF2D3748);
}

class MachenjiTheme {
  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: MachenjiColors.primary,
      brightness: Brightness.dark,
      primary: MachenjiColors.primary,
      secondary: MachenjiColors.success,
      surface: MachenjiColors.surface,
      error: MachenjiColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: MachenjiColors.background,

      appBarTheme: const AppBarTheme(
        backgroundColor: MachenjiColors.background,
        foregroundColor: MachenjiColors.text,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: MachenjiColors.text,
          fontSize: 22,
          fontWeight: FontWeight.w900,
        ),
      ),

      cardTheme: CardThemeData(
        color: MachenjiColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: MachenjiColors.border),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MachenjiColors.surface,
        hintStyle: const TextStyle(color: MachenjiColors.textMuted),
        labelStyle: const TextStyle(color: MachenjiColors.textMuted),
        prefixIconColor: MachenjiColors.textMuted,
        suffixIconColor: MachenjiColors.textMuted,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: MachenjiColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: MachenjiColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: MachenjiColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: MachenjiColors.error,
            width: 1.5,
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MachenjiColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.2,
          ),
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: MachenjiColors.primary,
      ),
    );
  }
}