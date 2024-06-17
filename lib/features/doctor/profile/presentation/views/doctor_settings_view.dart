import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/core/common_ui/widgets/theme_changer.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/doctor/profile/presentation/widgets/doctor_logout_sheet_body.dart';
import 'package:mhi/features/patient/profile/patient_profile/presentation/widgets/app_rights_info.dart';

class DoctorProfileSettingsView extends StatelessWidget {
  const DoctorProfileSettingsView({super.key});

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
                icon: Icons.logout_outlined,
                value: "تسجيل الخروج",
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: context.theme.colorScheme.surface,
                    context: context,
                    isScrollControlled: false,
                    builder: (context) {
                      return const DoctorLogoutSheetBody();
                    },
                  );
                })
        ],
      ),
    );
  }
}
