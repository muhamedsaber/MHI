import 'package:flutter/material.dart';
import 'package:mhi/config/router/default_route.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/common_ui/widgets/bottom_nav_bar/doctor_bottom_nav_bar.dart';
import 'package:mhi/core/common_ui/widgets/bottom_nav_bar/user_bottom_nav_bar.dart';
import 'package:mhi/features/auth/login/presentation/views/login_view.dart';
import 'package:mhi/features/auth/signup/presentation/views/signup_view.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/views/open_fda_drugs_view.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/views/create_new_record_view.dart';
import 'package:mhi/features/doctor/patient_profile/presentation/views/patient_booking_profile.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/views/request_new_surgery_view.dart';
import 'package:mhi/features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:mhi/features/patient/booking/presentation/views/doctor_booking_profile_view.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/models/firebase_hospital_model.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/views/firebase_hospital_profile_view.dart';
import 'package:mhi/features/patient/mhi/presentation/views/subscription_rules_view.dart';
import 'package:mhi/features/patient/profile/patient_profile/presentation/views/patient_settings_view.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/views/search_for_doctors_view.dart';
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
          builder: (context) => const PatientSettingsView(),
        );
      case Routes.firebaseHospitalProfileView:
        //pass The args default value to avoid null exception
        final hospital = settings.arguments as FireBaseHospitalsModel;

        return MaterialPageRoute(
          builder: (context) => FirebaseHospitalProfileView(
            hospital: hospital,
          ),
        );

      case Routes.subscriptionRolesView:
        return MaterialPageRoute(
          builder: (context) => const SubscriptionRolesView(),
        );

      case Routes.doctorBookingProfileView:
        final doctor = settings.arguments as DoctorBookData;
        return MaterialPageRoute(
          builder: (context) => DoctorBookingProfileView(
            doctorBookData: doctor,
          ),
        );
      case Routes.doctorBottomNavBar:
        return MaterialPageRoute(
          builder: (context) => const DoctorBottomNavBar(),
        );
      case Routes.patientBookingProfile:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments as DoctorAppointementModel;

          return PatientBookingProfile(
            model: args,
          );
        });
      case Routes.createNewRecordView:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments as DoctorAppointementModel;
          return CreateNewRecordView(
            model: args,
          );
        });
      case Routes.requestNewSurgeryView:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments as DoctorAppointementModel;
          return RequestNewSurgeryView(
            model: args,
          );
        });
          case Routes.openFdaDrugsView:
        return MaterialPageRoute(builder: (context) {
          return const OpenFdaDrugsView();
        });
      default:
        return MaterialPageRoute(
            builder: (_) => DefaultErrorRoute(
                  routeName: settings.name ?? "null ",
                ));
    }
  }
}
