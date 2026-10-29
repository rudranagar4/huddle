import 'package:flutter/material.dart';

class AppColors {
  // --- Glassmorphic Ice-Blue / Light Theme (Matches Reference Design) ---
  static const Color glassBgStart = Color(0xFFE3F2FD); // Soft ice-blue top
  static const Color glassBgEnd = Color(0xFFF0FDF4);   // Soft pale mint bottom
  static const Color glassBgPure = Color(0xFFF1F7FC);  // Neutral soft ice background

  // Translucent Card Surfaces & Borders
  static const Color glassCardLight = Color(0xE8FFFFFF);     // 91% translucent white
  static const Color glassCardLightSolid = Color(0xFFFFFFFF);
  static const Color glassBorderLight = Color(0xB3FFFFFF);   // Frost white border
  static const Color glassBorderSubtle = Color(0xFFE2E8F0);  // Soft border

  // Electric Cyan & Teal Brand Accents (From Reference Screenshot Buttons & Badges)
  static const Color cyanBrand = Color(0xFF00B4D8);
  static const Color cyanDark = Color(0xFF0284C7);
  static const Color cyanGlow = Color(0x3300B4D8);
  static const Color cyanPillBg = Color(0xFFE0F2FE);
  static const Color cyanPillText = Color(0xFF0284C7);

  // Mint / Green Success
  static const Color mintSuccess = Color(0xFF10B981);
  static const Color mintLight = Color(0xFFDCFCE7);
  static const Color mintText = Color(0xFF15803D);

  // Violet / Indigo Brand Secondary
  static const Color violetPrimary = Color(0xFF6366F1);
  static const Color violetLight = Color(0xFF818CF8);
  static const Color violetGlow = Color(0x266366F1);

  // Amber / Warm Accents (Night study, warnings, streak)
  static const Color amberWarm = Color(0xFFF59E0B);
  static const Color amberLight = Color(0xFFFEF3C7);
  static const Color amberText = Color(0xFFB45309);

  // Coral / Red (Urgency, decline)
  static const Color coral = Color(0xFFFF6B6B);
  static const Color coralLight = Color(0xFFFFE4E6);

  // High-Readability Typography
  static const Color textDarkHeading = Color(0xFF0B192C);  // Deep slate navy
  static const Color textDarkBody = Color(0xFF334155);     // Medium slate
  static const Color textDarkMuted = Color(0xFF64748B);    // Dim slate
  static const Color textDarkSubtle = Color(0xFF94A3B8);   // Very light slate

  // --- Midnight Glassmorphic Dark Theme Fallback ---
  static const Color navyBackgroundDark = Color(0xFF090D1A);
  static const Color navySurfaceDark = Color(0xFF10172A);
  static const Color navyCardDark = Color(0xCC162038);      // Frosted midnight navy
  static const Color navyCardHoverDark = Color(0xFF1E2B4A);
  static const Color navyBorderDark = Color(0xFF283858);
  static const Color textWhite = Color(0xFFF8FAFC);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textDim = Color(0xFF64748B);

  // Compatibility Aliases for older screen components
  static const Color tealAccent = Color(0xFF00B4D8);
  static const Color tealDark = Color(0xFF0284C7);
  static const Color tealSuccess = Color(0xFF10B981);
  static const Color tealGlow = Color(0x3300B4D8);
  static const Color amber = Color(0xFFF59E0B);
  static const Color amberGlow = Color(0x26F59E0B);
  static const Color lightBackground = Color(0xFFF1F7FC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF0B192C);
  static const Color lightTextSecondary = Color(0xFF64748B);

  // Gradients
  static const LinearGradient glassBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE2F1FD),
      Color(0xFFEDF7FC),
      Color(0xFFF5FAFD),
    ],
  );

  static const LinearGradient iceBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE2F1FD),
      Color(0xFFEDF7FC),
      Color(0xFFF5FAFD),
    ],
  );

  static const LinearGradient cyanActionGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00B4D8),
      Color(0xFF0096C7),
      Color(0xFF0284C7),
    ],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00B4D8),
      Color(0xFF0284C7),
    ],
  );

  static const LinearGradient glassCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xF5FFFFFF),
      Color(0xE6FFFFFF),
    ],
  );

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1E293B),
      Color(0xFF090D1A),
    ],
  );

  static const LinearGradient tealGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00B4D8),
      Color(0xFF0D9488),
    ],
  );
}
