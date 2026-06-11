import 'package:flutter/material.dart';

import 'package:quiz_royale/core/theme/app_colors.dart';
import 'package:quiz_royale/core/theme/app_dimensions.dart';
import 'package:quiz_royale/core/theme/app_text_styles.dart';

class QrAvatar extends StatelessWidget {
  const QrAvatar({
    super.key,
    required this.initials,
    this.avatarUrl,
    this.size = AppDimensions.avatarMD,
    this.playerColor,
    this.rank,
    this.isCurrentUser = false,
  });

  final String initials;
  final String? avatarUrl;
  final double size;
  final Color? playerColor;
  final int? rank;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    final color = playerColor ?? AppColors.cosmicIndigo;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.8), color],
            ),
            border: Border.all(
              color: isCurrentUser ? AppColors.crownGold : color.withOpacity(0.4),
              width: isCurrentUser ? 3 : 2,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 12,
                spreadRadius: -2,
              ),
            ],
          ),
          child: avatarUrl != null
              ? ClipOval(
                  child: Image.network(
                    avatarUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildInitials(size),
                  ),
                )
              : _buildInitials(size),
        ),
        if (rank != null)
          Positioned(
            bottom: -4,
            right: -4,
            child: _RankBadge(rank: rank!, size: size * 0.38),
          ),
        if (isCurrentUser)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: const BoxDecoration(
                color: AppColors.crownGold,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.star_rounded,
                color: AppColors.royalPurple,
                size: size * 0.2,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildInitials(double size) {
    return Center(
      child: Text(
        initials.length > 2
            ? initials.substring(0, 2).toUpperCase()
            : initials.toUpperCase(),
        style: AppTextStyles.labelLarge.copyWith(
          color: AppColors.white,
          fontSize: size * 0.35,
        ),
      ),
    );
  }
}

class _RankBadge extends StatelessWidget {
  const _RankBadge({required this.rank, required this.size});

  final int rank;
  final double size;

  Color get _badgeColor {
    switch (rank) {
      case 1:
        return AppColors.crownGold;
      case 2:
        return const Color(0xFFC0C0C0);
      case 3:
        return const Color(0xFFCD7F32);
      default:
        return AppColors.cosmicIndigo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _badgeColor,
        shape: BoxShape.circle,
        border: const Border.fromBorderSide(
          BorderSide(color: AppColors.royalPurple, width: 1.5),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '#$rank',
        style: AppTextStyles.labelSmall.copyWith(
          color: AppColors.royalPurple,
          fontSize: size * 0.4,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
