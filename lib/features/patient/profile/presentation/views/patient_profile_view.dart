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

  // while Trying to use Normal context navigation extinsion
  //to navigate i had alots of problems in the navigation
  // so i used the rootNavigator: true to solve the problem
  //
  //Problem(1)
  // The Preseistent Bottom nav bar is never hidden after navigating to the new screen
  // this happens because the context used to navigate is the context of the bottom nav bar
  // so i had to make the rootNavigator: true to solve this problem
  //

  //Problem(2)
  // The new screen is not pushed even with the rootNavigator: true
  // Could not find a generator for route RouteSettings("/PatientSettingsView", null) in the _CustomTabViewState.
  // i faced this error



  ///do not use the normal context to navigate to the new screen
  navigateToPatientSettingsView(BuildContext context) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) {
        return const PatientSettingsView();
      },
    ));
  }
}
