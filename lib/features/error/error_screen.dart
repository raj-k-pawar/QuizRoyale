import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_strings.dart';
import '../../core/constants/route_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/qr_button.dart';
import '../../shared/widgets/qr_scaffold.dart';
import '../../shared/widgets/qr_star_field.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.error,
    this.onRetry,
  });

  final String? error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return QrScaffold(
      body: QrStarField(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.screenPaddingH,
              vertical: AppDimensions.screenPaddingV,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIllustration(),
                const SizedBox(height: AppDimensions.xxl),
                Text(
                  AppStrings.error,
                  style: AppTextStyles.displayMedium.copyWith(
                    color: AppColors.neonMagenta,
                  ),
                ),
                const SizedBox(height: AppDimensions.base),
                Text(
                  error ?? AppStrings.unknownError,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimensions.xxxl),
                QrButton(
                  label: AppStrings.retry,
                  onPressed: onRetry ??
                      () => context.go(RouteConstants.splash),
                  icon: Icons.refresh_rounded,
                ),
                const SizedBox(height: AppDimensions.base),
                QrButton(
                  label: AppStrings.backToHome,
                  onPressed: () => context.go(RouteConstants.splash),
                  variant: QrButtonVariant.ghost,
                  icon: Icons.home_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.elasticOut,
      builder: (_, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.neonMagenta.withOpacity(0.1),
          border: Border.all(
            color: AppColors.neonMagenta.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: const Center(
          child: Text(
            '😵',
            style: TextStyle(fontSize: 64),
          ),
        ),
      ),
    );
  }
}
