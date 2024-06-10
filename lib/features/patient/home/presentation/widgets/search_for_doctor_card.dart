import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';

class SearchForDoctorsHomeView extends StatelessWidget {
  const SearchForDoctorsHomeView({
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
            gradient: AppThemeing.patientGradient,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10.w,
          right: 10.w,
          bottom: 36.h,
          child: SizedBox(
            height: 120.h,
            child: Image.asset(Assets.doctorVector),
          ),
        ),
        Column(
          children: [
            verticleSpace(10),
            Container(
              margin: EdgeInsets.only(top: 55.h, right: 30.w, left: 30.w),
              height: 43.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.searchForDoctors);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.lightGreen,
                      size: 25.h,
                    ),
                    Text(
                      AppStrings.searchForDoctor,
                      style:
                          AppTextStyles.jannat18BoldOnPrimary(context).copyWith(
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
