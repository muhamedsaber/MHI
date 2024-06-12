import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';

class MhiTitle extends StatelessWidget {
  const MhiTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified,
                color: AppColors.lightGreen,
                size: 30.sp,
              ),
              horizontalSpace(10),
              Text(
                "مصر للتأمين الصحي",
                style: AppTextStyles.jannat18BoldWhite.copyWith(
                  fontSize: 20.sp,
                  color: context.theme.colorScheme.onSurface,
                ),
              )
            ],
          );
  }
}