import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer(
      {super.key,
      required this.borderRadius,
      required this.height,
      required this.width});
  final double height;
  final double width;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.theme.colorScheme.tertiaryContainer,
      highlightColor: context.theme.colorScheme.onTertiaryContainer,
      
      child: Container(
        margin: EdgeInsets.only(left: 8.w),
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class SpecializesShimmer extends StatelessWidget {
  const SpecializesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetricHorizontalMedium,
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          reverse:true,
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomShimmer(
              width: 80.w,
              height: 40.h,
              borderRadius: BorderRadius.circular(7.r),
            );
          },
        ),
      ),
    );
  }
}
