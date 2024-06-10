import 'package:flutter/material.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/profile/presentation/views/patient_settings_view.dart';
import 'package:mhi/features/patient/profile/presentation/widgets/patient_profile_details.dart';

class PatientProfileView extends StatelessWidget {
  const PatientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PatientProfileDetails(
      widget: Column(
        children: [
          OptionButton(
            icon: Icons.pending_actions_sharp,
            value: "السجلات الطبية",
            onTap: () {},
          ),
          verticleSpace(13),
          OptionButton(
            icon: Icons.person,
            value: "تعديل البيانات",
            onTap: () {},
          ),
          verticleSpace(13),
          OptionButton(
            icon: Icons.settings,
            value: "الإعدادات",
            onTap: () {
              navigateToPatientSettingsView(context);
            },
          ),
          verticleSpace(13),
        ],
      ),
    ));
  }

  navigateToPatientSettingsView(BuildContext context) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) {
        return const PatientSettingsView();
      },
    ));
  }
}
