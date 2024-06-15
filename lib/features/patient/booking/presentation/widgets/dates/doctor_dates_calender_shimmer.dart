import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:shimmer/shimmer.dart';

class CalenderShimmer extends StatelessWidget {
  const CalenderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h, // Adjusted height for better visual representation
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Shimmer.fromColors(
            baseColor: context.theme.colorScheme.surface,
            highlightColor: AppColors.lighGrey,
            child: Column(
              children: [
                verticleSpace(20),
                Row(
                  children: [
                    horizontalSpace(10),
                    Shimmer.fromColors(
                      baseColor: context.theme.colorScheme.surface,
                      highlightColor: AppColors.lighGrey,
                      child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(8.r),
                          )),
                    ),
                   const Spacer(),
                    Shimmer.fromColors(
                      baseColor: context.theme.colorScheme.surface,
                      highlightColor: AppColors.lighGrey,
                      child: Container(
                          height: 40.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(8.r),
                          )),
                    ),
                    const Spacer(),
                    Shimmer.fromColors(
                      baseColor: AppColors.lighGrey,
                      highlightColor: AppColors.deepGrey,
                      child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(8.r),
                          )),
                    ),
                    horizontalSpace(10),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
