import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class DoctorBookingProfile extends StatelessWidget {
  const DoctorBookingProfile({super.key, required this.model});
  final DoctorBookData model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
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
            height: 2.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onSurface.withOpacity(0.8),
              borderRadius: BorderRadius.circular(100.r),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.h),
          ),
          verticleSpace(10),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: 10.h,
              bottom: 10.h,
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onSurface.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              model.name ?? "غير متوفر",
              style: AppTextStyles.jannat18BoldPrimaryColor(context)
                  .copyWith(fontSize: 18.sp, color: AppColors.lightGreen),
            ),
          ),
          DataWideShape(
            title: "التخصص",
            value: model.specialize?.name ?? "لا يوجد",
          ),
          DataWideShape(
            title: "المستشفي",
            value: model.hospitalId?.name ?? "لا يوجد",
          ),
          verticleSpace(4),
          Divider(
            thickness: 0.2,
            indent: 20.w,
            endIndent: 20.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
                buttonText: "حجز موعد",
                onPressed: () {},
                buttonTextSize: 20.sp,
                backGroundColor: AppColors.lightGreen,
                buttonWidth: 1000.w),
          )
        ],
      ),
    );
  }
}
