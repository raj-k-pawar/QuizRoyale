import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';

/// Spinning crown loader — used for full-screen loading states.
class QrLoader extends StatefulWidget {
  const QrLoader({
    super.key,
    this.message,
    this.size = 56.0,
    this.color = AppColors.crownGold,
  });

  final String? message;
  final double size;
  final Color color;

  @override
  State<QrLoader> createState() => _QrLoaderState();
}

class _QrLoaderState extends State<QrLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnim;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _rotateAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _pulseAnim = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return RotationTransition(
              turns: _rotateAnim,
              child: ScaleTransition(
                scale: _pulseAnim,
                child: child,
              ),
            );
          },
          child: Icon(
            Icons.emoji_events_rounded,
            size: widget.size,
            color: widget.color,
            shadows: [
              Shadow(
                color: widget.color.withOpacity(0.6),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        if (widget.message != null) ...[
          const SizedBox(height: AppDimensions.base),
          Text(
            widget.message!,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

/// Small inline spinner for button/card loading states.
class QrSpinner extends StatelessWidget {
  const QrSpinner({
    super.key,
    this.size = 20.0,
    this.color = AppColors.crownGold,
    this.strokeWidth = 2.5,
  });

  final double size;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}

/// Full-screen loading overlay.
class QrLoadingOverlay extends StatelessWidget {
  const QrLoadingOverlay({
    super.key,
    this.message,
    this.isVisible = true,
  });

  final String? message;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Container(
      color: AppColors.royalPurple.withOpacity(0.85),
      alignment: Alignment.center,
      child: QrLoader(message: message),
    );
  }
}
