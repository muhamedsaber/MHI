import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';

class PatientCardContent extends StatelessWidget {
  const PatientCardContent({
    super.key,
    required this.model,
  });

  final PatientModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.0.h),
      child: Center(
        child: Container(
          height: 165.h,
          width: 370.w,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.userHomeCard)),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.0.h, right: 45.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                verticleSpace(20),
                Text(": الأسم", style: AppTextStyles.jannat18BoldWhite),
                Expanded(
                  child: Text(
                    editLongNames(model.name ?? "لا يوجد اسم"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.jannat20ExtraBoldWhite,
                  ),
                ),
                verticleSpace(5),
                Text(": تاريخ الميلاد", style: AppTextStyles.jannat18BoldWhite),
                Text(model.birthday.formattedDate,
                    style: AppTextStyles.jannat20ExtraBoldWhite),
                verticleSpace(22),
              ],
            ),
          ),
        ),
      ),
    );
  }

  editLongNames(String name) {
    if (name.length > 20) {
      return "...${name.substring(0, 20)}";
    } else {
      return name;
    }
  }
}
