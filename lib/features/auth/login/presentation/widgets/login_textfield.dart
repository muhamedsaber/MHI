import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.textDirection,
    required this.textAlign,
    required this.textInputType,
    required this.validator,
    required this.controller,
    required this.hintText,
  });

  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  final String hintText;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          style: const TextStyle(
            color: AppColors.deepPurple,
            fontWeight: FontWeight.w600,
            decorationThickness: 0,
          ),
          keyboardType: widget.textInputType,
          textInputAction: TextInputAction.done,
          textDirection: widget.textDirection,
          textAlign: widget.textAlign,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: widget.hintText,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
            hintStyle: AppTextStyles.jannat18BoldOnPrimary(context).copyWith(
              color: AppColors.deepGrey.withOpacity(0.5),
              fontSize: 15.sp,
            ),
            errorStyle: AppTextStyles.jannat18BoldOnPrimary(context).copyWith(
              color: AppColors.lightRed,
              fontSize: 15.sp,
            ),
            errorMaxLines: 1,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lightGreen,
                  width: 1.5,
                  style: BorderStyle.solid,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lightRed,
                  width: 1.5,
                  style: BorderStyle.solid,
                )),
            border: _borderBuilder(),
            enabledBorder: _borderBuilder(),
            focusedBorder: _borderBuilder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _borderBuilder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.sliverWhite, width: 0.w),
    );
  }
}
