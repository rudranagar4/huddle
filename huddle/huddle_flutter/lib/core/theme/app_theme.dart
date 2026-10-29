import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  // --- Glassmorphic Light Theme (Primary Brand Theme) ---
  static ThemeData get lightTheme {
    final textTheme = GoogleFonts.interTextTheme(ThemeData.light().textTheme);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.glassBgPure,
      primaryColor: AppColors.cyanBrand,
      colorScheme: const ColorScheme.light(
        primary: AppColors.cyanBrand,
        secondary: AppColors.cyanDark,
        surface: AppColors.glassCardLightSolid,
        error: AppColors.coral,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textDarkHeading,
      ),
      textTheme: textTheme.copyWith(
        displayLarge: textTheme.displayLarge?.copyWith(
          color: AppColors.textDarkHeading,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.0,
        ),
        headlineLarge: textTheme.headlineLarge?.copyWith(
          color: AppColors.textDarkHeading,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          color: AppColors.textDarkHeading,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
        ),
        titleLarge: textTheme.titleLarge?.copyWith(
          color: AppColors.textDarkHeading,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          color: AppColors.textDarkHeading,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: textTheme.bodyLarge?.copyWith(
          color: AppColors.textDarkBody,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: textTheme.bodyMedium?.copyWith(
          color: AppColors.textDarkMuted,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: textTheme.bodySmall?.copyWith(
          color: AppColors.textDarkSubtle,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.textDarkHeading),
        titleTextStyle: TextStyle(
          color: AppColors.textDarkHeading,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.glassCardLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(color: AppColors.glassBorderLight, width: 1.2),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintStyle: const TextStyle(color: AppColors.textDarkSubtle, fontSize: 14),
        labelStyle: const TextStyle(color: AppColors.textDarkMuted, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.glassBorderSubtle),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.glassBorderSubtle),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.cyanBrand, width: 1.8),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.cyanDark,
        unselectedItemColor: AppColors.textDarkMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }

  // --- Frosted Midnight Dark Theme ---
  static ThemeData get darkTheme {
    final textTheme = GoogleFonts.interTextTheme(ThemeData.dark().textTheme);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.navyBackgroundDark,
      primaryColor: AppColors.cyanBrand,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.cyanBrand,
        secondary: AppColors.cyanDark,
        surface: AppColors.navySurfaceDark,
        error: AppColors.coral,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: AppColors.textWhite,
      ),
      textTheme: textTheme.copyWith(
        displayLarge: textTheme.displayLarge?.copyWith(
          color: AppColors.textWhite,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.0,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          color: AppColors.textWhite,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        titleLarge: textTheme.titleLarge?.copyWith(
          color: AppColors.textWhite,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          color: AppColors.textWhite,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: textTheme.bodyLarge?.copyWith(
          color: AppColors.textWhite,
        ),
        bodyMedium: textTheme.bodyMedium?.copyWith(
          color: AppColors.textMuted,
        ),
        bodySmall: textTheme.bodySmall?.copyWith(
          color: AppColors.textDim,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.textWhite),
        titleTextStyle: TextStyle(
          color: AppColors.textWhite,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.navyCardDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(color: AppColors.navyBorderDark, width: 1.2),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.navySurfaceDark,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintStyle: const TextStyle(color: AppColors.textDim, fontSize: 14),
        labelStyle: const TextStyle(color: AppColors.textMuted, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.navyBorderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.navyBorderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.cyanBrand, width: 1.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.coral),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.cyanBrand,
        unselectedItemColor: AppColors.textDim,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }
}
