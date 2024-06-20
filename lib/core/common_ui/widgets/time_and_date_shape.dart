import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';

class TimeAndDateShape extends StatelessWidget {
  const TimeAndDateShape({super.key, required this.date, required this.time});
  final String? time;
  final String? date;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceTint,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            horizontalSpace(5),
            Row(
              children: [
                const Icon(Icons.calendar_today,
                color:AppColors.sliverWhite,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  getFormatedDate(date),
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                )
              ],
            ),
            Container(
              height: 30.h,
              width: 1.8.w,
              color: Colors.white,
            ),
            Row(
              children: [
                const Icon(Icons.schedule,
                color: AppColors.sliverWhite,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  time ?? "غير معرف",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                )
              ],
            ),
            horizontalSpace(5)
          ],
        ));
  }

  getFormatedDate(String? date) {
    if (date == null) {
      return "غير معرف";
    }
    try {
      return date.formattedDate;
    } catch (e) {
      return date;
    }
  }
}
