import 'package:flutter/material.dart';
import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/core/common_ui/widgets/theme_changer.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/profile/presentation/widgets/app_rights_info.dart';
import 'package:mhi/features/patient/profile/presentation/widgets/logout_sheet_body.dart';

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
                icon: Icons.logout_outlined,
                value: "تسجيل الخروج",
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: context.theme.colorScheme.surface,
                    context: context,
                    isScrollControlled: false,
                    builder: (context) {
                      return LogoutSheetBody(
                        onTapToLogout: () async {
                          // await logoutPatient();

                          await Future.delayed(const Duration(seconds: 2), () {
                            navigateToLoginView(context);
                          });
                        },
                      );
                    },
                  );
                })
          ],
        ));
  }

  // logoutPatient() async {
  //   Alerts().showCustomToast(color: Colors.green, message: "جاري تسجيل الخروج");
  //   await PatientCache().removeUser();
  //   await CacheHelper.setData(
  //       key: DatabaseConstants.isPatientLoggedIn, value: false);
  //   await PatientDatabase.deleteAll();
  // }

  navigateToLoginView(BuildContext context) {
    context.navigateToAndReplace(Routes.loginView);
  }
}
