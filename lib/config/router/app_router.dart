import 'package:flutter/material.dart';
import 'package:mhi/config/router/default_route.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/common_ui/widgets/bottom_nav_bar/user_bottom_nav_bar.dart';
import 'package:mhi/features/auth/login/presentation/views/login_view.dart';
import 'package:mhi/features/auth/signup/presentation/views/signup_view.dart';
import 'package:mhi/features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/models/firebase_hospital_model.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/views/firebase_hospital_profile_view.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/views/firebase_hospitals_view.dart';
import 'package:mhi/features/patient/profile/presentation/views/patient_settings_view.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/views/search_for_doctors_view.dart';
import 'package:mhi/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUpView:
        return MaterialPageRoute(
          builder: (context) {
            return const SignupView();
          },
        );
      case Routes.userBottomNavBar:
        return MaterialPageRoute(
          builder: (context) => const UserBottomNavBar(),
        );

      case Routes.searchForDoctors:
        return MaterialPageRoute(
          builder: (context) => const SearchForDoctors(),
        );
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.patientSettingsView:
        return MaterialPageRoute(
          builder: (context) =>  PatientSettingsView(),
        );
      case Routes.firebaseHospitalProfileView:
       //pass The args default value to avoid null exception
        final hospital = settings.arguments as FireBaseHospitalsModel;

       
        return MaterialPageRoute(
          
          builder: (context) =>  FirebaseHospitalProfileView(hospital:hospital,),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => DefaultErrorRoute(
                  routeName: settings.name ?? "null ",
                ));
    }
  }
}
