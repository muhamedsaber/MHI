import 'package:flutter/material.dart';
import 'package:mhi/config/router/default_route.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/features/onBoarding/presentation/views/onboarding_view.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default:
        return MaterialPageRoute(
            builder: (_) => DefaultErrorRoute(
                  routeName: settings.name ?? "null ",
                ));
    }
  }
}
