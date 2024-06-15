import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';

class VerifiedTitle extends StatelessWidget {
  const VerifiedTitle({super.key,
  required this.title
  });
 final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified,
                color: AppColors.lightGreen,
                size: 25.sp,
              ),
              horizontalSpace(10),
              Flexible(
                child: Text(
                  title,
                  style: AppTextStyles.jannat18BoldWhite.copyWith(
                    fontSize: 20.sp,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              )
            ],
          );
  }
}