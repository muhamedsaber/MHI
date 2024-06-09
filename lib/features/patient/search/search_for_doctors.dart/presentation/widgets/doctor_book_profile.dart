import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class DoctorBookingProfile extends StatelessWidget {
  const DoctorBookingProfile({super.key, required this.model});
  final BookModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: context.width,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 5.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onSurface.withOpacity(0.8),
              borderRadius: BorderRadius.circular(100.r),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.h),
          ),
          verticleSpace(10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: context.theme.brightness == Brightness.dark
                  ? context.theme.colorScheme.surface.withBlue(45)
                  : context.theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    model.name ?? "غير متاح",
                    style: AppTextStyles.jannat18BoldPrimaryColor(context)
                        .copyWith(
                      fontSize: 20.sp,
                      color: AppColors.lighBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          verticleSpace(10),
          Divider(
            thickness: 0.2,
            indent: 20.w,
            endIndent: 20.w,
          ),
          Expanded(
            child: ListView(
              children: [
                DataWideShape(
                  title: "التخصص",
                  value: model.specialize!.name ?? "لا يوجد",
                ),
                DataWideShape(
                  title: "المستشفي",
                  value: model.hospitalId!.name ?? "لا يوجد",
                ),
                DataWideShape(
                  title: "عنوان المستشفي",
                  value: model.hospitalId!.address ?? "لا يوجد",
                ),
                // CustomButton(buttonText: , onPressed: onPressed, buttonTextSize: buttonTextSize, backGroundColor: backGroundColor, buttonWidth: buttonWidth)
              ],
            ),
          )
        ],
      ),
    );
  }
}
