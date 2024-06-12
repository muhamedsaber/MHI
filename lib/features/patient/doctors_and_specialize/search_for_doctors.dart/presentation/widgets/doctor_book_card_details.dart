import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/person_icon.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class DoctorBookCardDetails extends StatelessWidget {
  const DoctorBookCardDetails(
      {super.key, required this.model, this.icon, required this.onTap});
  final DoctorBookData model;
  final Icon? icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.colorScheme.surface,
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10),
                icon != null
                    ? IconButton(onPressed: onTap, icon: icon!)
                    : const SizedBox.shrink(),
                const Spacer(),
                Text(
                  model.name ?? "غير متاح",
                  style:
                      AppTextStyles.jannat18BoldPrimaryColor(context).copyWith(
                    fontSize: 18.sp,
                    color: AppColors.lighBlue,
                  ),
                ),
                horizontalSpace(10),
                const PersonIcon(
                  size: 70,
                )
              ],
            ),
            const Divider(
              thickness: 0.3,
            ),
            verticleSpace(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.specialize!.name ?? "غير متاح",
                      style: AppTextStyles.jannat18BoldPrimaryColor(context),
                    )
                  ],
                ),
                horizontalSpace(10),
                Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.primary.withOpacity(0.089),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(" التخصص",
                      style: AppTextStyles.jannat18BoldPrimaryColor(context)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
