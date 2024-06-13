import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class PatientHomeImageCard extends StatelessWidget {
  const PatientHomeImageCard({
    super.key,
    required this.buttontext,
    required this.image,
    required this.onTap,
    required this.secondColor,
    required this.text,
  });
  final String image;
  final String text;
  final String buttontext;
  final Color secondColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 220.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Colors.black, secondColor]),
          borderRadius:  BorderRadius.all(Radius.circular(12.r)),
          image: DecorationImage(
              image: AssetImage(image), fit: BoxFit.cover, opacity: 0.5),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(text, style: AppTextStyles.jannat18BoldWhite),
              SizedBox(
                height: 5.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightGreen,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: onTap,
                child: Text(buttontext, style: AppTextStyles.jannat18BoldWhite),
              )
            ],
          ),
        ),
      ),
    );
  }
}
