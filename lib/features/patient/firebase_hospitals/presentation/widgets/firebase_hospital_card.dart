import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/models/firebase_hospital_model.dart';

class FirebaseHospitalsCard extends StatelessWidget {
  const FirebaseHospitalsCard({super.key, required this.hospital});
  final FireBaseHospitalsModel hospital;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 14.w, left: 14.w, top: 13.h),
      height: 130.h,
      margin: EdgeInsets.only(top: 10.h, left: 17, right: 17),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            hospital.name ?? "",
            textAlign: TextAlign.end,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.jannat18BoldWhite.copyWith(
                color: context.theme.colorScheme.onSurface,
                fontSize: 16.sp,
                letterSpacing: 1),
          ),
          SizedBox(
            height: 5.h,
          ),
          const Divider(
            color: AppColors.lighGrey,
            thickness: 1,
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(children: [
            Expanded(
              child: Text(
                hospital.address ?? "",
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.jannat18BoldWhite.copyWith(
                  color: context.theme.colorScheme.primary,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Icon(
              Icons.location_on,
              color: AppColors.lighBlue,
              size: 30.h,
            )
          ])
        ],
      ),
    );
  }
}
