import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mhi/core/constants/app_constants.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_cubit.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/logic/cubit/firebase_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/cubit/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/doctors/cubit/get_doctors_by_hospital_cubit.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/Logic/saved_doctors/cubit/saved_doctors_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/cubit/specializes_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/doctors/book_doctors_cubit.dart';
import 'package:mhi/firebase_options.dart';
import 'package:mhi/mhi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDependencyInjection();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.themeBox);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SignupCubit>()),
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<SpecializesCubit>()),
        BlocProvider(create: (context) => getIt<BookDoctorsCubit>()),
        BlocProvider(create: (context) => getIt<SavedDoctorsCubit>()),
        BlocProvider(create: (context) => getIt<PatientRecordCubit>()),
        BlocProvider(create: (context) => getIt<FirebaseHospitalsCubit>()),
        BlocProvider(create: (context) => getIt<AllHospitalsCubit>()),
        BlocProvider(create: (context) => getIt<GetDoctorsByHospitalCubit>()),
      ],
      child: const MhiApp(),
    ),
  );
}
