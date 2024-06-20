import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/presentation/logic/cubit/change_appointement_status_cubit.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';

class ChangeBookingStatusButtons extends StatelessWidget {
  const ChangeBookingStatusButtons({super.key, required this.model});
  final DoctorAppointementModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  context.navigateBack();
                  context
                      .read<ChangeAppointementStatusCubit>()
                      .changeAppointementStatus(
                          bookingId: model.id ?? "", status: "Done");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lighBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r),
                    ),
                  ),
                ),
                child: Text(
                  "حضر الحجز",
                  style: AppTextStyles.jannat18BoldWhite.copyWith(
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  context.navigateBack();
                  context
                      .read<ChangeAppointementStatusCubit>()
                      .changeAppointementStatus(
                          bookingId: model.id ?? "", status: "Cancelled");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                ),
                child: Text(
                  "لم يحضر الحجز",
                  style: AppTextStyles.jannat18BoldWhite.copyWith(
                    color: context.theme.colorScheme.onError,
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
