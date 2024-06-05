import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_strings.dart';

class OnBoardingModel {
  final String image;
  final String textDesciption;

  OnBoardingModel({required this.image, required this.textDesciption});
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding1,
    textDesciption: AppStrings.onBoarding1String,
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding2,
    textDesciption: AppStrings.onBoarding2String,
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding3,
    textDesciption: AppStrings.onBoarding3String,
  )
];
