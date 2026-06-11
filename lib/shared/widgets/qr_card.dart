import 'package:flutter/material.dart';

import 'package:quiz_royale/core/theme/app_colors.dart';
import 'package:quiz_royale/core/theme/app_dimensions.dart';

class QrCard extends StatelessWidget {
  const QrCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.gradient,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.onTap,
    this.elevation = 0,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradient;
  final Color? borderColor;
  final double borderWidth;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final radius =
        borderRadius ?? BorderRadius.circular(AppDimensions.radiusXL);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? AppColors.midnightViolet : null,
        borderRadius: radius,
        border: Border.all(
          color: borderColor ?? AppColors.divider,
          width: borderWidth,
        ),
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: elevation * 4,
                  offset: Offset(0, elevation),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          splashColor: AppColors.crownGold.withOpacity(0.08),
          highlightColor: AppColors.crownGold.withOpacity(0.04),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppDimensions.cardPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}

class QrGlowCard extends StatelessWidget {
  const QrGlowCard({
    super.key,
    required this.child,
    this.glowColor = AppColors.crownGold,
    this.padding,
    this.onTap,
  });

  final Widget child;
  final Color glowColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return QrCard(
      padding: padding,
      borderColor: glowColor,
      borderWidth: 2,
      elevation: 0,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
          boxShadow: [
            BoxShadow(
              color: glowColor.withOpacity(0.25),
              blurRadius: 20,
              spreadRadius: -4,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
