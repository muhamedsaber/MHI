import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/spacing.dart';

class RecordsDataShape extends StatelessWidget {
  const RecordsDataShape({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: 200.w,
          padding:
              EdgeInsets.only(top: 10.h, bottom: 10.h, right: 5.h, left: 5.w),
          margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(
            value,
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.jannat20BoldOnPrimaryColor(context).copyWith(
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        horizontalSpace(6),
        Container(
          width: 90.w,
         
          padding:
              EdgeInsets.only(top: 10.h, bottom: 10.h, right: 5.w, left: 5.w),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(
            title,
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.jannat20BoldOnPrimaryColor(context).copyWith(
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
