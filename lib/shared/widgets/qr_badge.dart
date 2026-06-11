import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';

enum QrBadgeVariant { gold, cyan, magenta, green, orange, neutral }

class QrBadge extends StatelessWidget {
  const QrBadge({
    super.key,
    required this.label,
    this.icon,
    this.variant = QrBadgeVariant.gold,
    this.compact = false,
  });

  final String label;
  final IconData? icon;
  final QrBadgeVariant variant;
  final bool compact;

  Color get _color {
    switch (variant) {
      case QrBadgeVariant.gold:
        return AppColors.crownGold;
      case QrBadgeVariant.cyan:
        return AppColors.neonCyan;
      case QrBadgeVariant.magenta:
        return AppColors.neonMagenta;
      case QrBadgeVariant.green:
        return AppColors.neonGreen;
      case QrBadgeVariant.orange:
        return AppColors.neonOrange;
      case QrBadgeVariant.neutral:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? AppDimensions.sm : AppDimensions.md,
        vertical: compact ? 3 : AppDimensions.xs,
      ),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppDimensions.radiusRound),
        border: Border.all(color: _color.withOpacity(0.5), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: _color, size: compact ? 10 : 13),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: _color,
              fontSize: compact ? 10 : 11,
            ),
          ),
        ],
      ),
    );
  }
}

/// Animated streak fire badge shown during gameplay.
class QrStreakBadge extends StatelessWidget {
  const QrStreakBadge({super.key, required this.streak});

  final int streak;

  @override
  Widget build(BuildContext context) {
    if (streak < 2) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6B00), Color(0xFFFFAB00)],
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusRound),
        boxShadow: [
          BoxShadow(
            color: AppColors.neonOrange.withOpacity(0.5),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🔥', style: TextStyle(fontSize: 14)),
          const SizedBox(width: 4),
          Text(
            '$streak',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
