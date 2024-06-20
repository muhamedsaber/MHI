import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';

class ReservationCountWidget extends StatelessWidget {
  const ReservationCountWidget({super.key, required this.totalAppointements});
  final String totalAppointements;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            totalAppointements,
            style: AppTextStyles.jannat24BoldBoldOnPrimary(context)
                .copyWith(color: context.theme.colorScheme.onSurface),
          ),
          horizontalSpace(20),
          Text(
            "عدد المواعيد اليوم",
            style: AppTextStyles.jannat18BoldWhite
                .copyWith(color: context.theme.colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
