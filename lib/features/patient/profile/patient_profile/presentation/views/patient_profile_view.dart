import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
import 'package:mhi/features/common/records/presentation/views/patient_records_view.dart';
import 'package:mhi/features/patient/profile/patient_profile/presentation/views/patient_settings_view.dart';
import 'package:mhi/features/patient/profile/patient_profile/presentation/widgets/patient_profile_details.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/Logic/update_patient_profile_cubit.dart';

class PatientProfileView extends StatefulWidget {
  const PatientProfileView({super.key});

  @override
  State<PatientProfileView> createState() => _PatientProfileViewState();
}

class _PatientProfileViewState extends State<PatientProfileView> {
  Future<PatientModel?> getPatientIdFromCache() async {
    PatientModel? model = await PatientCache().getUser();
    return model;
  }

  @override
  void initState() {
    getPatientIdFromCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PatientProfileDetails(
      widget: Column(
        children: [
          OptionButton(
            icon: Icons.pending_actions_sharp,
            value: "السجلات الطبية",
            onTap: () async {
              PatientModel? patientId = await getPatientIdFromCache();
              Future.delayed(const Duration(seconds: 0), () {
                navigateToPatientSettingsView(context,
                    widget: PatientRecordView(
                      patientId: patientId!.id!,
                    ));
              });
            },
          ),
          verticleSpace(13),
          OptionButton(
            icon: Icons.settings,
            value: "الإعدادات",
            onTap: () {
              navigateToPatientSettingsView(context,
                  widget: const PatientSettingsView());
            },
          ),
        ],
      ),
    ));
  }

  ///do not use the normal context to navigate to the new screen
  navigateToPatientSettingsView(BuildContext context,
      {required Widget widget}) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
  }
}
