import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:shimmer/shimmer.dart';

class DoctorShimmerListViewBuilder extends StatelessWidget {
  const DoctorShimmerListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const DoctorBookCardShimmer();
        },
      ),
    );
  }
}

class DoctorBookCardShimmer extends StatelessWidget {
  const DoctorBookCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: context.width,
      child: Card(
        color: context.theme.colorScheme.onPrimary.withOpacity(0.1),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: context.theme.scaffoldBackgroundColor,
                        highlightColor: AppColors.lighGrey.withOpacity(0.3),
                        child: Container(
                          width: 100.w,
                          height: 20.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  horizontalSpace(10),
                  Shimmer.fromColors(
                    baseColor: context.theme.scaffoldBackgroundColor,
                    highlightColor: AppColors.lighGrey.withOpacity(0.3),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              verticleSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: context.theme.scaffoldBackgroundColor,
                        highlightColor: AppColors.lighGrey.withOpacity(0.3),
                        child: Container(
                          width: 100.w,
                          height: 20.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  horizontalSpace(10),
                  Shimmer.fromColors(
                    baseColor: context.theme.scaffoldBackgroundColor,
                    highlightColor: AppColors.lighGrey.withOpacity(0.3),
                    child: Container(
                      width: 100.w,
                      height: 20.h,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
