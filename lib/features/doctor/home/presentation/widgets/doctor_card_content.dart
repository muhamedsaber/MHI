import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';

class DoctorCardContent extends StatelessWidget {
  const DoctorCardContent({
    super.key,
    required this.model,
  });

  final DoctorModel model;

  @override
  Widget build(BuildContext context) {
    log(model.id??"not found");
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
                model.hospitalName == null
                    ? const SizedBox.shrink()
                    : Text(": المستشفي",
                        style: AppTextStyles.jannat18BoldWhite),
                Text(model.hospitalName!.toString(),
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
