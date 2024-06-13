import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/theming.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key, required this.patientName, required this.gradient});
  final String patientName;
  final Gradient gradient;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            MainAppBar(gradient: gradient),
            Container(
              margin: EdgeInsets.only(top: 80.h, left: 30.w, right: 30.w),
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 15.h),
              height: 130.h,
              width: 400.w,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                patientName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.jannat18BoldPrimaryColor(context),
              ),
            ),
            Container(
              height: 120.h,
              margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 50),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 30,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.outer,
                        color: Colors.black.withOpacity(0.2))
                  ]),
              child: Center(
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
          ],
        ),
      ],
    );
  }
}
