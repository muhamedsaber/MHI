import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/features/patient/mhi/presentation/widgets/main_hospitals_sheet_content.dart';

class MainHospitalsWidget extends StatelessWidget {
  const MainHospitalsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useRootNavigator: true,
          builder: (context) {
            return const MainHospitalsSheetBody();
          },
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Container(
              padding: EdgeInsets.only(top: 20.h, right: 20),
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(Assets.brillianceEffect),
                    fit: BoxFit.cover,
                    opacity: 0.2),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColors.deepBlue, AppColors.lighBlue],
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "الفروع",
                    style: AppTextStyles.jannat18BoldWhite.copyWith(
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "الرئيسية لهيئة التأمين الصحي",
                    style: AppTextStyles.jannat18BoldWhite.copyWith(
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 100.w,
            bottom: -45.h,
            child: SizedBox(
              height: 300.h,
              width: 300.w,
              child: Image.asset(Assets.hospital3D),
            ),
          ),
        ],
      ),
    );
  }
}


