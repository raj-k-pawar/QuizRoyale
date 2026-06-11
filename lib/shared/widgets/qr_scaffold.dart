import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';

class QrScaffold extends StatelessWidget {
  const QrScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.useGradient = true,
    this.padding,
    this.extendBodyBehindAppBar = false,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final bool useGradient;
  final EdgeInsetsGeometry? padding;
  final bool extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor:
          useGradient ? Colors.transparent : AppColors.royalPurple,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: useGradient
          ? Container(
              decoration: const BoxDecoration(
                gradient: AppColors.backgroundGradient,
              ),
              child: _buildBody(),
            )
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    if (padding != null) {
      return Padding(padding: padding!, child: body);
    }
    return body;
  }
}

/// Adds the safe-area-aware horizontal screen padding used consistently.
class QrScreenPadding extends StatelessWidget {
  const QrScreenPadding({
    super.key,
    required this.child,
    this.horizontal = AppDimensions.screenPaddingH,
    this.vertical = 0,
  });

  final Widget child;
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: child,
    );
  }
}
