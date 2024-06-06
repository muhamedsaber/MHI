import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:mhi/mhi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<SignupCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<LoginCubit>(),
      ),
    ],
    child: const MhiApp(),
  ));
}
