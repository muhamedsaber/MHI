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
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.h),
          margin: EdgeInsets.symmetric(vertical: 3.h),
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
            style: AppTextStyles.jannat14OnSurface(context),
          ),
        ),
        horizontalSpace(6),
        Container(
          width: 90.w,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.h),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(title,
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.jannat14OnSurface(context)),
        ),
      ],
    );
  }
}
