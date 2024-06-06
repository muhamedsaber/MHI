import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/common_ui/widgets/custom_smooth_page_indicator.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/onBoarding/data/onboarding_model.dart';
import 'package:mhi/features/onBoarding/presentation/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors
            .white, //static color because its initial step before customizing the theme
        body: Column(
          children: [
            OnBoardingViewBody(
              pageController: _pageController,
              onPageChanged: updateTheCurrentPage,
            ),
            CustomSmoothPageIndicator(
              count: onBoardingData.length,
              pageController: _pageController,
            ),
            verticleSpace(50),
            buildControllButtons(),
          ],
        ),
      ),
    );
  }

  updateTheCurrentPage(int p0) {
    setState(() {
      current = p0;
    });
  }

  Widget buildControllButtons() {
    return Padding(
      padding: AppPadding.symmetricHorizontalMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: navigateToLogin,
            child: Text(AppStrings.skipAR,
                style: AppTextStyles.jannat18BoldPrimaryColor(context)),
          ),
          current == onBoardingData.length - 1
              ? CustomButton(
                  buttonText: AppStrings.loginKeyWord,
                  buttonWidth: 200.w,
                  buttonTextSize: 22,
                  backGroundColor: AppColors.lightGreen,
                  onPressed: navigateToLogin,
                )
              : CustomButton(
                  buttonText: AppStrings.nextAr,
                  buttonWidth: 200.w,
                  buttonTextSize: 28,
                  backGroundColor: AppColors.lightGreen,
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(microseconds: 100),
                        curve: Curves.bounceInOut);
                  },
                )
        ],
      ),
    );
  }

  navigateToLogin()async {
    
   await setOnBoardingVisitStatus();
  if (mounted) {
     context.navigateTo(Routes.loginView);
  }
  }

  setOnBoardingVisitStatus() async {
    await CacheHelper.setData(
        key: DatabaseConstants.isUserVisitedOnBoarding, value: true);
  }
}
