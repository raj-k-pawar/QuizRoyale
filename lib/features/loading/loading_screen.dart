import 'package:flutter/material.dart';

import 'package:quiz_royale/core/constants/app_strings.dart';
import 'package:quiz_royale/core/theme/app_colors.dart';
import 'package:quiz_royale/core/theme/app_dimensions.dart';
import 'package:quiz_royale/core/theme/app_text_styles.dart';
import 'package:quiz_royale/shared/widgets/qr_loader.dart';
import 'package:quiz_royale/shared/widgets/qr_star_field.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.royalPurple,
      body: QrStarField(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: AppColors.backgroundGradient,
          ),
          child: SizedBox.expand(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrLoader(
                    message: message ?? AppStrings.loading,
                    size: 64,
                  ),
                  const SizedBox(height: AppDimensions.xxl),
                  _LoadingTips(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingTips extends StatefulWidget {
  @override
  State<_LoadingTips> createState() => _LoadingTipsState();
}

class _LoadingTipsState extends State<_LoadingTips>
    with SingleTickerProviderStateMixin {
  static const _tips = [
    '⚡ Answer faster for bonus points!',
    '🔥 Build a streak to multiply your score!',
    '👑 Top 3 players share the crown!',
    '🧠 Every correct answer earns XP!',
    '🎯 You have 15 seconds per question!',
  ];

  late AnimationController _ctrl;
  late Animation<double> _opacity;
  int _tipIndex = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
    _ctrl.forward();
    _cycle();
  }

  Future<void> _cycle() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      await _ctrl.reverse();
      if (!mounted) return;
      setState(() {
        _tipIndex = (_tipIndex + 1) % _tips.length;
      });
      await _ctrl.forward();
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
        child: Text(
          _tips[_tipIndex],
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
