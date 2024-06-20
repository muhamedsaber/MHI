import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class TopTextDescription extends StatelessWidget {
  const TopTextDescription(
      {super.key,
      required this.title,
      required this.description,
    });
  final String title;
  final String description;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 17, right: 17),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(title,
                textAlign: TextAlign.right,
                style: AppTextStyles.jannat18ExtraBoldOnPrimary(context)
                    .copyWith(color: AppColors.deepPurple)),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(description,
                textAlign: TextAlign.right,
                style: AppTextStyles.jannat18BoldOnPrimary(context)
                    .copyWith(fontSize: 15.sp, color: AppColors.deepGrey)),
          ),
          SizedBox(
            height: 10.h,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            height: 2.h,
            width: double.infinity,
            color: AppColors.deepBlue,
          ),
        ],
      ),
    );
  }
}
