import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/presentation/views/mhi_medicine_view.dart';

class SearchForMedicineHomeScreen extends StatelessWidget {
  const SearchForMedicineHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 120.h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              AppColors.lightGreen,
              AppColors.lighBlue,
            ]),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
        ),
        Positioned(
          left: 5.w,
          right: 20.w,
          bottom: 0.h,
          child: SizedBox(
            height: 230.h,
            child: Image.asset(Assets.medicineShadow),
          ),
        ),
        Positioned(
          left: 10.w,
          right: 10.w,
          bottom: 10.h,
          child: SizedBox(
            height: 230.h,
            child: Image.asset(Assets.medicines3d),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: const EdgeInsets.only(top: 65, right: 30, left: 30),
              height: 43.h,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: true,
                    builder: (context) {
                      return Container(
                          height: 200.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: context.theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r),
                              )
                          ),
                          child: Column(
                            children: [
                              // make two buttons
                              verticleSpace(30),
                              CustomButton(
                                  buttonText: "منظمة الصحة العالمية",
                                  onPressed: () {},
                                  buttonTextSize: 18.sp,
                                  backGroundColor: AppColors.lightGreen,
                                  buttonWidth: 300.w),
                              verticleSpace(30),
                              CustomButton(
                                  buttonText: "مصر للتأمين الصحي",
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>const MhiMedicineView(),
                                    ));
                                  },
                                  buttonTextSize: 18.sp,
                                  backGroundColor: AppColors.lightGreen,
                                  buttonWidth: 300.w)
                            ],
                          ));
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  foregroundColor: AppColors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.lightGreen,
                      size: 25.h,
                    ),
                    Text(
                      "ابحث عن دواء",
                      style: AppTextStyles.jannat18BoldWhite.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.lightGreen,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
