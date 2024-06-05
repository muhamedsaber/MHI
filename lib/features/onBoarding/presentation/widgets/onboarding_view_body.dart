import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/onBoarding/data/onboarding_model.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody(
      {super.key, required this.pageController, this.onPageChanged});

  final PageController pageController;
  final Function(int)? onPageChanged;

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: PageView.builder(
        onPageChanged: widget.onPageChanged,
        itemCount: onBoardingData.length,
        controller: widget.pageController,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                child: Image.asset(
                  onBoardingData[index].image,
                ),
              ),
              verticleSpace(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  onBoardingData[index].textDesciption,
                  textAlign: TextAlign.right,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.jannat18BoldOnPrimary(context).copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
