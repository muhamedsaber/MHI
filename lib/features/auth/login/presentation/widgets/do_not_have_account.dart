import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';

class DoNotHaveAnAccountWidget extends StatelessWidget {
  const DoNotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.navigateTo(Routes.signUpView);
          },
          child: Text(
            AppStrings.signupNow,
            style: AppTextStyles.jannat18BoldOnPrimary(context).copyWith(
              color: AppColors.lighBlue,
              fontSize: 15.sp,
            ),
          ),
        ),
        Text(
          AppStrings.doNotHaveAnAccount,
          style: AppTextStyles.jannat18BoldOnPrimary(context).copyWith(
            color: AppColors.deepGrey,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}
