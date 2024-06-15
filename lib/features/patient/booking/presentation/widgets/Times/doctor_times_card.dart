import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class DoctorTimeCard extends StatelessWidget {
  const DoctorTimeCard(
      {super.key,
      required this.time,
      required this.cardColor,
      required this.textColor});
  final String time;
  final Color cardColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Align(
          alignment: Alignment.center,
          child: Text(convertTo12HourFormat(time),
              textAlign: TextAlign.center,
              style: AppTextStyles.jannat18BoldOnPrimary(context)
                  .copyWith(color: textColor)),
        ),
      ),
    );
  }

  String convertTo12HourFormat(String time24) {
    try {
      List<String> parts = time24.split(':');
      int hour = int.parse(parts[0]);
      String minute = parts[1];
      String period = hour >= 12 ? 'مساءً' : 'صباحًا';
      int hour12 = hour % 12;
      hour12 = hour12 == 0 ? 12 : hour12;
      return '$hour12 : $minute - $period';
    } catch (e) {
      return time24;
    }
  }
}
