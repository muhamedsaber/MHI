import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onChanged});

  final String hintText;
  final Function(String) onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetricHorizontalMedium,
      child: SizedBox(
        height: 50.h,
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          textAlign: TextAlign.end,
          keyboardType: TextInputType.text,
          textDirection: TextDirection.ltr,
          style: AppTextStyles.jannat20BoldOnPrimaryColor(context).copyWith(
            color: AppColors.lighBlue,
          ),
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle:
                AppTextStyles.jannat20BoldOnPrimaryColor(context).copyWith(
              color: Colors.grey,
              fontSize: 18.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.lighBlue,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.lighBlue,
                width: 2.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
