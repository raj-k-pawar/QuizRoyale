import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/route_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/qr_star_field.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _crownController;
  late AnimationController _textController;
  late AnimationController _taglineController;

  late Animation<double> _crownScale;
  late Animation<double> _crownOpacity;
  late Animation<Offset> _crownSlide;

  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;

  late Animation<double> _taglineOpacity;

  @override
  void initState() {
    super.initState();

    _crownController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _taglineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _crownScale = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _crownController, curve: Curves.elasticOut),
    );
    _crownOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _crownController,
        curve: const Interval(0.0, 0.4),
      ),
    );
    _crownSlide = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _crownController, curve: Curves.easeOutCubic),
    );

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
    );

    _taglineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _taglineController, curve: Curves.easeIn),
    );

    _runSequence();
  }

  Future<void> _runSequence() async {
    await Future.delayed(const Duration(milliseconds: 200));
    await _crownController.forward();

    await Future.delayed(const Duration(milliseconds: 100));
    await _textController.forward();

    await Future.delayed(const Duration(milliseconds: 100));
    await _taglineController.forward();

    // Wait for splash duration then navigate
    await Future.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      // TODO(Phase 2): check auth state and route accordingly
      // For now route to loading as a demo
      context.go(RouteConstants.loading);
    }
  }

  @override
  void dispose() {
    _crownController.dispose();
    _textController.dispose();
    _taglineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.royalPurple,
      body: QrStarField(
        starCount: 120,
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.backgroundGradient,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Crown icon
                AnimatedBuilder(
                  animation: _crownController,
                  builder: (_, child) {
                    return FadeTransition(
                      opacity: _crownOpacity,
                      child: SlideTransition(
                        position: _crownSlide,
                        child: ScaleTransition(
                          scale: _crownScale,
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.goldGradient,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.crownGold.withOpacity(0.5),
                          blurRadius: 40,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.emoji_events_rounded,
                      size: 64,
                      color: AppColors.royalPurple,
                    ),
                  ),
                ),

                const SizedBox(height: AppDimensions.xl),

                // App name
                FadeTransition(
                  opacity: _textOpacity,
                  child: SlideTransition(
                    position: _textSlide,
                    child: ShaderMask(
                      shaderCallback: (bounds) =>
                          AppColors.goldGradient.createShader(bounds),
                      child: Text(
                        AppConstants.appName,
                        style: AppTextStyles.displayXL.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppDimensions.sm),

                // Tagline
                FadeTransition(
                  opacity: _taglineOpacity,
                  child: Text(
                    AppConstants.appTagline,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),

                const SizedBox(height: AppDimensions.huge),

                // Bottom loading bar
                FadeTransition(
                  opacity: _taglineOpacity,
                  child: _PulsingBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PulsingBar extends StatefulWidget {
  @override
  State<_PulsingBar> createState() => _PulsingBarState();
}

class _PulsingBarState extends State<_PulsingBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _anim = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        return Container(
          width: 48,
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusRound),
            color: AppColors.crownGold.withOpacity(_anim.value),
          ),
        );
      },
    );
  }
}
