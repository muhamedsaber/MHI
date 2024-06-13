import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:shimmer/shimmer.dart';

class SpecializesShimmer extends StatelessWidget {
  const SpecializesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetricHorizontalMedium,
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: context.theme.colorScheme.surfaceContainerHigh,
              highlightColor: context.theme.colorScheme.surfaceContainerLow,
              child: Container(
                margin: EdgeInsets.only(left: 8.w),
                height: 40.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
