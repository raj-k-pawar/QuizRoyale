import 'package:flutter/material.dart';

/// Quiz Royale color system.
/// Deep galactic purple base with electric gold crowns and neon accents —
/// evokes a night-sky arena that feels exciting but not aggressive for kids.
class AppColors {
  AppColors._();

  // ── Brand Core ───────────────────────────────────────────────────────────
  static const Color royalPurple = Color(0xFF1A0533);    // deep background
  static const Color midnightViolet = Color(0xFF2D0A5C); // card / surface
  static const Color cosmicIndigo = Color(0xFF3D1580);   // elevated surface

  // ── Crown Gold (primary accent) ──────────────────────────────────────────
  static const Color crownGold = Color(0xFFFFD700);
  static const Color crownGoldLight = Color(0xFFFFE566);
  static const Color crownGoldDark = Color(0xFFBFA000);

  // ── Energy Neons (secondary accents) ─────────────────────────────────────
  static const Color neonCyan = Color(0xFF00E5FF);
  static const Color neonMagenta = Color(0xFFFF3CAC);
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color neonOrange = Color(0xFFFF6B00);

  // ── Semantic ─────────────────────────────────────────────────────────────
  static const Color success = Color(0xFF00C853);
  static const Color error = Color(0xFFFF1744);
  static const Color warning = Color(0xFFFFAB00);
  static const Color info = Color(0xFF00B0FF);

  // ── Neutrals ─────────────────────────────────────────────────────────────
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF0E6FF);
  static const Color textPrimary = Color(0xFFEEDDFF);
  static const Color textSecondary = Color(0xFFAA88CC);
  static const Color textDisabled = Color(0xFF664488);
  static const Color divider = Color(0xFF3D1580);

  // ── Player colours (for avatars / battle UI) ──────────────────────────────
  static const List<Color> playerColors = [
    Color(0xFF00E5FF), // cyan
    Color(0xFFFF3CAC), // magenta
    Color(0xFF39FF14), // green
    Color(0xFFFF6B00), // orange
    Color(0xFFFFD700), // gold
    Color(0xFF7B2FFF), // violet
  ];

  // ── Gradient helpers ─────────────────────────────────────────────────────
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [midnightViolet, royalPurple],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [crownGoldLight, crownGold, crownGoldDark],
  );

  static const LinearGradient neonButtonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [neonCyan, Color(0xFF7B2FFF)],
  );

  static const RadialGradient arenaGlow = RadialGradient(
    center: Alignment.topCenter,
    radius: 1.2,
    colors: [Color(0xFF3D1580), royalPurple],
  );
}
