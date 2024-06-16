import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/Theme/theme_extensions.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:shimmer/shimmer.dart';

class BookingHospitalsCardShimmer extends StatelessWidget {
  const BookingHospitalsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140.h,
        child: ListView.builder(
          itemCount: 5,
          reverse: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              color: context.theme.scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Shimmer.fromColors(
                      baseColor: context.theme.shimmerBaseColor(),
                      highlightColor: context.theme.shimmerHighlghtColor(),
                      child: Container(
                        width: 300.w,
                        height: 30.h,
                        color: context.theme.colorScheme.surface,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Shimmer.fromColors(
                      baseColor: context.theme.shimmerBaseColor(),
                      highlightColor: context.theme.shimmerHighlghtColor(),
                      child: Container(
                        width: 100.w,
                        height: 20.h,
                        color: context.theme.colorScheme.surface,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            );
          },
          
        ));
  }
}
