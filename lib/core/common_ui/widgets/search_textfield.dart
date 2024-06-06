import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key,
      required this.hintText,
      required this.onSubmitted,
      required this.onButtonPressed,
      required this.onChanged});

  final void Function(String)? onSubmitted;
  final void Function()? onButtonPressed;
  final String hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetricHorizontalMedium,
      child: SizedBox(
        height:50.h,
        child: TextField(
          onSubmitted: onSubmitted,
          textAlign: TextAlign.end,
          keyboardType: TextInputType.text,
          textDirection: TextDirection.ltr,
          onChanged: onChanged,
          style: AppTextStyles.jannat20BoldOnPrimaryColor(context),
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: AppTextStyles.jannat20BoldOnPrimaryColor(context).copyWith(
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
