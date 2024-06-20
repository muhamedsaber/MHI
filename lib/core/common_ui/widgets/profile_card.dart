import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/common_ui/widgets/user_profile_icon.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key, required this.username, required this.gradient});
  final String username;
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
                username,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.jannat18BoldPrimaryColor(context),
              ),
            ),
            const UserProfileIcon()
          ],
        ),
      ],
    );
  }
}
