import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class SpecializeDoctorCard extends StatelessWidget {
  const SpecializeDoctorCard({super.key,
  required this.doctor
  });
 final DoctorBookData doctor;
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.specialize!.name ?? "غير متاح",
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
            );
  }
}