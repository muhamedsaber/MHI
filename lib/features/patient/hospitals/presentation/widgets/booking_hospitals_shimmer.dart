import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:shimmer/shimmer.dart';

class BookingHospitalsCardShimmer extends StatelessWidget {
  const BookingHospitalsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140.h,
        child: ListView.builder(
          reverse: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              color: context.theme.colorScheme.surface.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Shimmer.fromColors(
                      baseColor: context.theme.colorScheme.surface.withOpacity(0.8),
                      highlightColor:AppColors.lighGrey.withOpacity(0.5),
                      child: Container(
                        width: 300.w,
                        height: 30.h,
                        color: context.theme.colorScheme.surface,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Shimmer.fromColors(
                      baseColor: context.theme.colorScheme.surface.withOpacity(0.8),
                      highlightColor:AppColors.lighGrey.withOpacity(0.5),
                      child: Container(
                        width: 100.w,
                        height: 20.h,
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            );
          },
          itemCount: 5,
        ));
  }
}