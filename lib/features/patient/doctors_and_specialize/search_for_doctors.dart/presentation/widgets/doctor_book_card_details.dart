import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/person_icon.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/specialize_doctor_book_card.dart';

class DoctorBookCardDetails extends StatelessWidget {
  const DoctorBookCardDetails(
      {super.key, required this.model, this.icon, required this.onFavoriteIconTapped});
  final DoctorBookData model;
  final Icon? icon;
  final Function()? onFavoriteIconTapped;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.colorScheme.surface,
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                horizontalSpace(10),
                buildFavoriteIcon(),
                const Spacer(),
                Text(
                  model.name ?? "غير متاح",
                  style: AppTextStyles.jannat18LightBlue
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
            SpecializeDoctorCard(
              doctor: model,
            )
          ],
        ),
      ),
    );
  }

  Widget buildFavoriteIcon() {
    return icon != null
        ? IconButton(onPressed: onFavoriteIconTapped, icon: icon!)
        : const SizedBox.shrink();
  }
}
