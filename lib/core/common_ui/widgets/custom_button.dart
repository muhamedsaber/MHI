import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.buttonTextSize,
      required this.backGroundColor,
      required this.buttonWidth,
      this.textColor});
  final String buttonText;
  final double buttonTextSize;
  final VoidCallback? onPressed;
  final Color backGroundColor;
  final Color? textColor;
  final double buttonWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.w,
      width: buttonWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyles.jannat18BoldOnPrimary(context).copyWith(
                color: textColor ?? Colors.white, fontSize: buttonTextSize.sp),
          ),
        ),
      ),
    );
  }
}
