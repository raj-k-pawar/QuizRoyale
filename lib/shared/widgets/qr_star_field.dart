import 'dart:math';

import 'package:flutter/material.dart';

import 'package:quiz_royale/core/theme/app_colors.dart';

class QrStarField extends StatefulWidget {
  const QrStarField({
    super.key,
    this.starCount = 80,
    this.child,
  });

  final int starCount;
  final Widget? child;

  @override
  State<QrStarField> createState() => _QrStarFieldState();
}

class _QrStarFieldState extends State<QrStarField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Star> _stars;
  final Random _rng = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _stars = List.generate(widget.starCount, (_) => _Star.random(_rng));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => CustomPaint(
            painter: _StarPainter(_stars, _controller.value),
            child: const SizedBox.expand(),
          ),
        ),
        if (widget.child != null) widget.child!,
      ],
    );
  }
}

class _Star {
  _Star({
    required this.x,
    required this.y,
    required this.radius,
    required this.phase,
    required this.speed,
  });

  factory _Star.random(Random rng) => _Star(
        x: rng.nextDouble(),
        y: rng.nextDouble(),
        radius: rng.nextDouble() * 1.8 + 0.4,
        phase: rng.nextDouble(),
        speed: rng.nextDouble() * 0.5 + 0.5,
      );

  final double x;
  final double y;
  final double radius;
  final double phase;
  final double speed;
}

class _StarPainter extends CustomPainter {
  _StarPainter(this.stars, this.animValue);

  final List<_Star> stars;
  final double animValue;

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      final double twinkle =
          (sin((animValue * star.speed + star.phase) * pi * 2) + 1) / 2;
      final double opacity = 0.2 + twinkle * 0.7;

      final paint = Paint()
        ..color = _starColor(star).withOpacity(opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(star.x * size.width, star.y * size.height),
        star.radius * (0.8 + twinkle * 0.4),
        paint,
      );
    }
  }

  Color _starColor(_Star star) {
    if (star.phase < 0.1) return AppColors.crownGold;
    if (star.phase < 0.2) return AppColors.neonCyan;
    return AppColors.white;
  }

  @override
  bool shouldRepaint(_StarPainter oldDelegate) =>
      oldDelegate.animValue != animValue;
}
