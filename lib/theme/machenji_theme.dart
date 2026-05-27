import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MachenjiColors {
  // Machenji web brand color
  static const Color primary = Color(0xFF3AA2BF);
  static const Color primaryDark = Color(0xFF2F8CA6);
  static const Color primarySoft = Color(0xFFE8F6FA);

  // Light app surfaces
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceSoft = Color(0xFFF8FAFC);
  static const Color surfaceRaised = Color(0xFFF1F5F9);

  // Text
  static const Color text = Color(0xFF0F172A);
  static const Color textMuted = Color(0xFF64748B);
  static const Color textSubtle = Color(0xFF94A3B8);

  // Borders
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderSoft = Color(0xFFF1F5F9);

  // Status colors
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFDC2626);
}

class MachenjiTheme {
  static ThemeData get light {
    final baseTextTheme = GoogleFonts.poppinsTextTheme();

    final colorScheme = ColorScheme.fromSeed(
      seedColor: MachenjiColors.primary,
      brightness: Brightness.light,
      primary: MachenjiColors.primary,
      secondary: MachenjiColors.primaryDark,
      surface: MachenjiColors.surface,
      error: MachenjiColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: MachenjiColors.background,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: baseTextTheme.apply(
        bodyColor: MachenjiColors.text,
        displayColor: MachenjiColors.text,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: MachenjiColors.primary,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.3,
        ),
      ),

      cardTheme: CardThemeData(
        color: MachenjiColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: MachenjiColors.border),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MachenjiColors.surfaceSoft,
        hintStyle: GoogleFonts.poppins(
          color: MachenjiColors.textMuted,
        ),
        labelStyle: GoogleFonts.poppins(
          color: MachenjiColors.textMuted,
        ),
        prefixIconColor: MachenjiColors.textMuted,
        suffixIconColor: MachenjiColors.textMuted,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: MachenjiColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: MachenjiColors.primary,
            width: 1.6,
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
            width: 1.6,
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MachenjiColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: MachenjiColors.surfaceRaised,
          disabledForegroundColor: MachenjiColors.textSubtle,
          minimumSize: const Size.fromHeight(54),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.2,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: MachenjiColors.primary,
          side: const BorderSide(color: MachenjiColors.primary),
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MachenjiColors.primary,
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: MachenjiColors.primary,
        circularTrackColor: MachenjiColors.primarySoft,
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: MachenjiColors.text,
        contentTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: MachenjiColors.border,
        thickness: 1,
      ),

      iconTheme: const IconThemeData(
        color: MachenjiColors.primary,
      ),
    );
  }
}