import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class TabBarToggel extends StatelessWidget {
  const TabBarToggel(
      {super.key,
      required this.tabController,
      required this.firstTabText,
      required this.secondTabText});
  final TabController tabController;
  final String firstTabText;
  final String secondTabText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 100,
                offset: const Offset(0, -10),
              ),
            ],
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: TabBar(
                  isScrollable: false,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 20.sp,
                  ),
                  unselectedLabelColor: AppColors.lightGreen,
                  labelColor: Colors.white,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                  indicatorWeight: 6,
                  dividerHeight: 0,
                  splashBorderRadius: BorderRadius.circular(10.r),
                  splashFactory: InkRipple.splashFactory,
                  onTap: (value) {
                    if (value == 0) {
                    } else {}
                  },
                  indicator: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  controller: tabController,
                  tabs: [
                    SizedBox(
                      width: 220.w,
                      child: Tab(
                        child: Text(firstTabText,
                            style:
                                AppTextStyles.jannat18BoldOnPrimary(context)),
                      ),
                    ),
                    SizedBox(
                      width: 220.w,
                      child: Tab(
                        child: Text(secondTabText,
                            style:
                                AppTextStyles.jannat18BoldOnPrimary(context)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
