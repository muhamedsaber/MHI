import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/widgets/update_patient_profile_form.dart';

class UpdatePatientInformation extends StatelessWidget {
  const UpdatePatientInformation({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600.h,
        width: context.width,
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            verticleSpace(10),
            AppThemeing.dragHandle(context),
            verticleSpace(10),
            const UpdatePatientProfileForm()
          ],
        ));
  }
}
