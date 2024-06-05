
import 'package:flutter/material.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator(
      {super.key, required this.pageController, required this.count});
  final PageController pageController;
  final int count;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect: ExpandingDotsEffect(
          dotWidth: 14,
          dotHeight: 13,
          dotColor: AppColors.deepBlue.withOpacity(0.7),
          activeDotColor: AppColors.lightGreen),
    );
  }
}
