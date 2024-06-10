import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';

class DataWideShape extends StatelessWidget {
  const DataWideShape({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: context.theme.colorScheme.surface,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.jannat18BoldPrimaryColor(context)
                          .copyWith(
                        fontSize: 18.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      value,
                      maxLines:1,
                      overflow: TextOverflow.fade,
                      style: AppTextStyles.jannat18BoldPrimaryColor(context)
                          .copyWith(
                        fontSize: 20.sp,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                width: 4.w,
                height: 60.h,
                decoration: BoxDecoration(
                    color: AppColors.lighBlue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
