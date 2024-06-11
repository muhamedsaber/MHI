import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    super.key,
    required this.onPressed,
    required this.phoneNumber,
  });
  final void Function()? onPressed;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 15,
          ),
        ],
        gradient: const LinearGradient(colors: [
          Color(0xff065ef2),
          Color(0xff419fff),
        ]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            )),
            child: Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Icon(
                      Icons.phone,
                      color: const Color(0xff065ef2),
                      size: 30.h,
                                  
                                   ),
                 ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "اتصل",
                  style: AppTextStyles.jannat18BoldWhite.copyWith(
                    color: const Color(0xff065ef2),
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          Text(
            phoneNumber,
            textAlign: TextAlign.end,
            style: AppTextStyles.jannat18BoldWhite.copyWith(
                color: Colors.white, fontSize: 18.sp, letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}