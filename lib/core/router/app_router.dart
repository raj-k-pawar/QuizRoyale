import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/error/error_screen.dart';
import '../../features/loading/loading_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../constants/route_constants.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteConstants.splash,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => ErrorScreen(
      error: state.error?.message ?? 'Unknown error occurred',
    ),
    routes: [
      GoRoute(
        path: RouteConstants.splash,
        name: RouteConstants.splashName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SplashScreen(),
        ),
      ),
      GoRoute(
        path: RouteConstants.loading,
        name: RouteConstants.loadingName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoadingScreen(),
        ),
      ),
      GoRoute(
        path: RouteConstants.error,
        name: RouteConstants.errorName,
        pageBuilder: (context, state) {
          final error = state.extra as String? ?? 'Something went wrong';
          return MaterialPage(
            child: ErrorScreen(error: error),
          );
        },
      ),
    ],
  );
});
