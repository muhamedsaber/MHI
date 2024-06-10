import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/core/common_ui/widgets/profile_card.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
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
            icon: Icons.settings,
            value: "الإعدادات",
            onTap: () {},
          ),
          verticleSpace(13),
          OptionButton(
            icon: Icons.person,
            value: "تعديل البيانات",
            onTap: () {},
          ),
          verticleSpace(13),
        ],
      ),
    ));
  }
}
