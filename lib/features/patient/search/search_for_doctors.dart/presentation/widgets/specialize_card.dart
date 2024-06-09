import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/specializes/models/specialize_model.dart';

class SpecializeCard extends StatelessWidget {
  const SpecializeCard(
      {super.key,
      required this.model,
      required this.backgroundColor,
      required this.textColor});
  final SpecializeModel model;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 8.w),
        padding: AppPadding.symmetricHorizontalSmall,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            Text(
              model.name,
              style: AppTextStyles.jannat18BoldWhite.copyWith(
                color: textColor,
              ),
            ),
          ],
        ));
  }
}