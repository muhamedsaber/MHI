import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/views/firebase_hospitals_view.dart';

class HospitalsHomeView extends StatelessWidget {
  const HospitalsHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context,rootNavigator:true).push(MaterialPageRoute(
                builder: (context) => FirebaseHospitalsView(),
                
              ));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: AppColors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 0.h, right: 20),
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(Assets.brillianceEffect),
                    fit: BoxFit.cover,
                    opacity: 0.2),
                gradient: AppThemeing.patientGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: Image.asset(Assets.googleMapImage3d),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "مراكز",
                        style: AppTextStyles.jannat18ExtraBoldWhite.copyWith(
                          color: Colors.white,
                          fontSize: 25.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "الرعاية الصحية",
                        style: AppTextStyles.jannat18ExtraBoldWhite.copyWith(
                          color: Colors.white,
                          fontSize: 25.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
