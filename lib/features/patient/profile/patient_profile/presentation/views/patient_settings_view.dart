import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/core/common_ui/widgets/theme_changer.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/profile/patient_profile/presentation/widgets/app_rights_info.dart';
import 'package:mhi/features/patient/profile/patient_profile/presentation/widgets/logout_sheet_body.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/Logic/update_patient_profile_cubit.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/widgets/update_patient_profile_sheet.dart';

class PatientSettingsView extends StatelessWidget {
  const PatientSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder(context: context, title: "الإعدادات"),
        body: Column(
          children: [
            verticleSpace(20),
            const ThemeChanger(),
            verticleSpace(15),
            OptionButton(
                icon: Icons.verified_sharp,
                value: "MHI عن",
                onTap: () {
                  appRightsInfo(context: context);
                }),
            verticleSpace(15),
            OptionButton(
              icon: Icons.person,
              value: "تعديل البيانات الشخصية",
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: context.theme.colorScheme.surface,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const UpdatePatientInformation();
                  },
                );
              },
            ),
            verticleSpace(15),
            OptionButton(
                icon: Icons.logout_outlined,
                value: "تسجيل الخروج",
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: context.theme.colorScheme.surface,
                    context: context,
                    isScrollControlled: false,
                    builder: (context) {
                      return const LogoutSheetBody();
                    },
                  );
                })
          ],
        ));
  }
}
