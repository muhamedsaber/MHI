import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/theming.dart';

class DoctorBookingProfileAppbar extends StatelessWidget {
  const DoctorBookingProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      gradient: AppThemeing.patientGradient,
      widget: Padding(
        padding: EdgeInsets.only(top: 45.h),
        child: Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 60.h,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            child: ShaderMask(
              shaderCallback: (bounds) {
                return AppThemeing.purpleGreenGradient.createShader(bounds);
              },
              child: Icon(
                Icons.account_circle_sharp,
                size: 120.h,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      withBackButton: true,
    );
  }
}
