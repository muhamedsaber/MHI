import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/constants/app_constants.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_cubit.dart';
import 'package:mhi/features/patient/saved/presentation/Logic/cubit/saved_doctors_cubit.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/logic/cubit/specializes_cubit.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/logic/doctors/book_doctors_cubit.dart';
import 'package:mhi/mhi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  await Hive.initFlutter();
  await PatientCache().getUser();
  await Hive.openBox(AppConstants.themeBox);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<SignupCubit>()),
      BlocProvider(create: (context) => getIt<LoginCubit>()),
      BlocProvider(create: (context) => getIt<SpecializesCubit>()),
      BlocProvider(create: (context) => getIt<BookDoctorsCubit>()),
      BlocProvider(create: (context) => getIt<SavedDoctorsCubit>()),
      BlocProvider(create: (context) => getIt<PatientRecordCubit>())
    ],
    child: const MhiApp(),
  ));
}
