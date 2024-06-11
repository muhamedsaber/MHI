import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key, required this.message,
   this.icon
  });
  final String message;
   final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Center(
     
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
           icon?? Icons.query_stats,
            color: AppColors.lighGrey,
            size: 70.sp,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            message,
            style: AppTextStyles.jannat18BoldWhite.copyWith(
              color: AppColors.lightRed.withOpacity(0.8),
              fontSize: 15.sp
            ),
          ),
        ],
      ),
    );
  }
}