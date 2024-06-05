import 'package:flutter/material.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class CustomTextFieldDescription extends StatelessWidget {
  const CustomTextFieldDescription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppStrings.astrik,
            style: AppTextStyles.jannat18ExtraBoldOnPrimary(context).copyWith(
              color: AppColors.lightRed,
            ),
          ),
          Text(
            description,
            style: AppTextStyles.jannat18ExtraBoldOnPrimary(context).copyWith(
              color: AppColors.deepPurple,
            ),
          )
        ],
      ),
    );
  }
}
