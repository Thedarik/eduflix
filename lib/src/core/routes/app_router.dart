import 'package:eduflix/src/core/style/colors.dart';
import 'package:eduflix/src/feature/auth/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'app_route_name.dart';

final class AppRouter<T extends Object?> {
  Route<T> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.splashPage:
        return _buildRoute(
          builder: const SplashPage(),
          settings: settings,
        );

      default:
        return _errorRoute();
    }
  }

  Route<T> _buildRoute(
          {required RouteSettings settings, required Widget builder}) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => builder,
        settings: settings,
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

  Route<T> _errorRoute() => MaterialPageRoute<T>(
        builder: (context) => Scaffold(
          body: Center(
            child: Text(
              'Error Route',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black,
                  ),
            ),
          ),
        ),
      );
}
