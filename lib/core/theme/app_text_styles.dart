import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ── Display (hero headings, score counters) ───────────────────────────────
  static TextStyle get displayXL => GoogleFonts.nunito(
        fontSize: 56,
        fontWeight: FontWeight.w900,
        color: AppColors.crownGold,
        letterSpacing: -1.0,
        height: 1.0,
      );

  static TextStyle get displayLarge => GoogleFonts.nunito(
        fontSize: 40,
        fontWeight: FontWeight.w900,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
        height: 1.1,
      );

  static TextStyle get displayMedium => GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.15,
      );

  // ── Headlines ─────────────────────────────────────────────────────────────
  static TextStyle get headlineLarge => GoogleFonts.nunito(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get headlineMedium => GoogleFonts.nunito(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.25,
      );

  static TextStyle get headlineSmall => GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  // ── Body ──────────────────────────────────────────────────────────────────
  static TextStyle get bodyLarge => GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  // ── Labels (buttons, chips, badges) ──────────────────────────────────────
  static TextStyle get labelLarge => GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.royalPurple,
        letterSpacing: 0.5,
      );

  static TextStyle get labelMedium => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: 0.3,
      );

  static TextStyle get labelSmall => GoogleFonts.nunito(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.textSecondary,
        letterSpacing: 0.8,
      );

  // ── Score / Counter ───────────────────────────────────────────────────────
  static TextStyle get scoreCounter => GoogleFonts.nunito(
        fontSize: 48,
        fontWeight: FontWeight.w900,
        color: AppColors.crownGold,
        letterSpacing: -1.5,
        shadows: [
          Shadow(
            color: AppColors.crownGold.withOpacity(0.6),
            blurRadius: 16,
          ),
        ],
      );

  static TextStyle get timerText => GoogleFonts.nunito(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: AppColors.neonCyan,
        letterSpacing: -1.0,
        shadows: [
          Shadow(
            color: AppColors.neonCyan.withOpacity(0.8),
            blurRadius: 20,
          ),
        ],
      );
}
