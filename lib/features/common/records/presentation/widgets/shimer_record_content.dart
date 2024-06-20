import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRecordContent extends StatelessWidget {
  const ShimmerRecordContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: List.generate(7, (index) {
              return Shimmer.fromColors(
                baseColor: context.theme.colorScheme.tertiaryContainer,
                highlightColor: context.theme.scaffoldBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200.w,
                          height: 50,
                          decoration: BoxDecoration(
                            color: context.theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                         horizontalSpace(10),
                        Container(
                          width: 100.w,
                          height: 50,
                          decoration: BoxDecoration(
                            color: context.theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                      ],
                    ),
                    verticleSpace(5)
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}