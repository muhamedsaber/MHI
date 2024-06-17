import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/features/doctor/profile/presentation/views/doctor_settings_view.dart';

class DoctorProfileSettingsButton extends StatelessWidget {
  const DoctorProfileSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionButton(
        icon: Icons.settings,
        value: "الإعدادات",
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => const DoctorProfileSettingsView(),
          ));
        });
  }
}
