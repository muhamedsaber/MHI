import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/router/default_route.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/login/presentation/views/login_view.dart';
import 'package:mhi/features/onBoarding/presentation/views/onboarding_view.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginView(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => DefaultErrorRoute(
                  routeName: settings.name ?? "null ",
                ));
    }
  }
}
