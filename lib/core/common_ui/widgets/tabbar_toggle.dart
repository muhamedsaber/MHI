import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';

class TabBarToggel extends StatelessWidget {
  const TabBarToggel(
      {super.key,
      required this.tabController,
      required this.firstTabText,
      required this.secondTabText});
  final TabController tabController;
  final String firstTabText;
  final String secondTabText;
  final bool isThemeApplicatable = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          decoration: BoxDecoration(
            color: isThemeApplicatable
                ? context.theme.scaffoldBackgroundColor
                : Colors.white,
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
                  
                  labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                  indicatorWeight: 6,
                  dividerHeight: 0,
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
                        child: AnimatedBuilder(
                          animation: tabController,
                          builder: (context, child) {
                            return Text(
                              firstTabText,
                              style: tabController.index == 0
                                  ? AppTextStyles.jannat20ExtraBoldWhite
                                  : AppTextStyles.jannat20ExtraBoldWhite
                                      .copyWith(color: AppColors.lightGreen),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 220.w,
                      child: Tab(
                        child: AnimatedBuilder(
                          animation: tabController,
                          builder: (context, child) {
                            return Text(
                              secondTabText,
                              style: tabController.index == 1
                                  ? AppTextStyles.jannat20ExtraBoldWhite
                                  : AppTextStyles.jannat20ExtraBoldWhite
                                      .copyWith(color: AppColors.lightGreen),
                            );
                          },
                        ),
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
