import 'package:flutter/material.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/doctor/profile/presentation/widgets/doctor_profile_data.dart';
import 'package:mhi/features/doctor/profile/presentation/widgets/doctor_profile_settings.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: DoctorCache().getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          return DoctorInformationData(
            model: snapshot.data!,
            widget: const DoctorProfileSettingsButton(),
          );
        } else {
          return DoctorInformationData(
            model: DoctorModel(),
            widget: const DoctorProfileSettingsButton(),
          );
        }
      },
    ));
  }
}
