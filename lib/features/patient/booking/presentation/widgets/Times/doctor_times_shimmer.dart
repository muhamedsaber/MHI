import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/Theme/theme_extensions.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:shimmer/shimmer.dart';

class DoctorTimesShimmer extends StatelessWidget {
  const DoctorTimesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      color: context.theme.scaffoldBackgroundColor,
      elevation: 0,
      child: SizedBox(
        height: 70.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) => Card(
                  color: context.theme.scaffoldBackgroundColor,
                  elevation: 1,
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Shimmer.fromColors(
                    direction: ShimmerDirection.ltr,
                    baseColor: context.theme.shimmerBaseColor(),
                    highlightColor: context.theme.shimmerHighlghtColor(),
                    child: Container(
                      height: 30.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
