import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quiz_royale/core/theme/app_colors.dart';
import 'package:quiz_royale/core/theme/app_dimensions.dart';
import 'package:quiz_royale/core/theme/app_text_styles.dart';

enum QrButtonVariant { primary, secondary, ghost, danger }

class QrButton extends StatelessWidget {
  const QrButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = QrButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.width,
    this.height = AppDimensions.buttonHeightLarge,
  });

  final String label;
  final VoidCallback? onPressed;
  final QrButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    final bool enabled = !isDisabled && !isLoading;

    void handlePress() {
      HapticFeedback.lightImpact();
      onPressed?.call();
    }

    switch (variant) {
      case QrButtonVariant.primary:
        return _GradientButton(
          label: label,
          icon: icon,
          isLoading: isLoading,
          enabled: enabled,
          onPressed: handlePress,
        );

      case QrButtonVariant.secondary:
        return OutlinedButton.icon(
          onPressed: enabled ? handlePress : null,
          icon: icon != null && !isLoading
              ? Icon(icon, size: AppDimensions.iconSM)
              : const SizedBox.shrink(),
          label: isLoading
              ? const _LoadingDots()
              : Text(label,
                  style: AppTextStyles.labelLarge
                      .copyWith(color: AppColors.crownGold)),
        );

      case QrButtonVariant.ghost:
        return TextButton.icon(
          onPressed: enabled ? handlePress : null,
          icon: icon != null && !isLoading
              ? Icon(icon, size: AppDimensions.iconSM, color: AppColors.neonCyan)
              : const SizedBox.shrink(),
          label: isLoading
              ? const _LoadingDots()
              : Text(label,
                  style: AppTextStyles.labelMedium
                      .copyWith(color: AppColors.neonCyan)),
        );

      case QrButtonVariant.danger:
        return ElevatedButton.icon(
          onPressed: enabled ? handlePress : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
            ),
          ),
          icon: icon != null && !isLoading
              ? Icon(icon, size: AppDimensions.iconSM)
              : const SizedBox.shrink(),
          label: isLoading
              ? const _LoadingDots()
              : Text(label,
                  style: AppTextStyles.labelLarge
                      .copyWith(color: AppColors.white)),
        );
    }
  }
}

class _GradientButton extends StatefulWidget {
  const _GradientButton({
    required this.label,
    required this.onPressed,
    required this.isLoading,
    required this.enabled,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool enabled;
  final IconData? icon;

  @override
  State<_GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<_GradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.enabled ? (_) => _controller.forward() : null,
      onTapUp: widget.enabled
          ? (_) {
              _controller.reverse();
              widget.onPressed();
            }
          : null,
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnim,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: widget.enabled ? 1.0 : 0.5,
          child: Container(
            decoration: BoxDecoration(
              gradient: widget.enabled
                  ? AppColors.goldGradient
                  : const LinearGradient(
                      colors: [Color(0xFF665533), Color(0xFF443322)],
                    ),
              borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
              boxShadow: widget.enabled
                  ? [
                      BoxShadow(
                        color: AppColors.crownGold.withOpacity(0.35),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            alignment: Alignment.center,
            child: widget.isLoading
                ? const _LoadingDots(color: AppColors.royalPurple)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(
                          widget.icon,
                          color: AppColors.royalPurple,
                          size: AppDimensions.iconSM,
                        ),
                        const SizedBox(width: AppDimensions.sm),
                      ],
                      Text(widget.label, style: AppTextStyles.labelLarge),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _LoadingDots extends StatefulWidget {
  const _LoadingDots({this.color = AppColors.royalPurple});

  final Color color;

  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final double offset = i / 3;
            final double val =
                ((_controller.value + offset) % 1.0 * 2 - 1).abs();
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.4 + val * 0.6),
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }
}
