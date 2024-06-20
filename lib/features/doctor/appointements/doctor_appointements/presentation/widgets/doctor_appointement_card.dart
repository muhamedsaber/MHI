import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/core/common_ui/widgets/time_and_date_shape.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/presentation/widgets/change_appointement_status_buttons.dart';

class DoctorAppointementCard extends StatelessWidget {
  const DoctorAppointementCard({super.key, required this.model});
  final DoctorAppointementModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          isScrollControlled: true,
          builder: (context) {
            return DoctorPatientProfileSheetBody(
              model: model,
            );
          },
        );
      },
      child: Card(
        color: context.theme.colorScheme.surface,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                model.patientId?.name ?? "غير معرف",
                style: AppTextStyles.jannat21BoldOnSurface(context)
                    .copyWith(fontSize: 17.sp),
              ),
              verticleSpace(10),
              TimeAndDateShape(date: model.day, time: model.time),
          
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorPatientProfileSheetBody extends StatelessWidget {
  const DoctorPatientProfileSheetBody({super.key, required this.model});
  final DoctorAppointementModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        padding: EdgeInsets.zero,
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          color: context.theme.scaffoldBackgroundColor,
        ),
        child: Column(
          children: [
            verticleSpace(10),
            AppThemeing.dragHandle(context),
            verticleSpace(30),
            verticleSpace(10),
             ChangeBookingStatusButtons(
              model:model,
            ),
            verticleSpace(10),
            OptionButton(
                icon: Icons.person,
                value: "الملف الشخصي للمريض",
                onTap: () {
                  context.navigateBack();
                  context.navigateTo(Routes.patientBookingProfile,
                      arguments: model);
                })
          ],
        ));
  }
}
