
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class FaxNumber extends StatelessWidget {
  const FaxNumber({
    super.key,
    required this.faxNumber,
  });

  final String faxNumber;
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
        gradient:const LinearGradient(colors: [
         
          Color(0xff065ef2),
          Color(0xff419fff),
        ]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding:const EdgeInsets.all(5),
            decoration:const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.fax,
              color:const Color(0xff065ef2),
              size: 30.h,
            ),
          ),
          Text(
            faxNumber,
            textAlign: TextAlign.end,
            style: AppTextStyles.jannat18BoldWhite.copyWith(
                color: Colors.white, fontSize: 18.sp, letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}
