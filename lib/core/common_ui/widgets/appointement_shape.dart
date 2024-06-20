import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/time_and_date_shape.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/appointements/data/models/patient_appointement_model.dart';

class AppointemtntShape extends StatelessWidget {
  const AppointemtntShape(
      {super.key,
      required this.model,
      required this.enableOnTap,
      required this.onTap});
  final PatientAppointmentModel model;
  final Function()? onTap;
  final bool enableOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enableOnTap ? onTap : null,
      child: Card(
        color: context.theme.colorScheme.surface,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            verticleSpace(15),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Flexible(
                    flex: 1000000,
                    fit: FlexFit.loose,
                    child: Text(
                      model.doctorID?.name ?? "غير معرف",
                      style: AppTextStyles.jannat18BoldPrimaryColor(context),
                    ),
                  ),
                  horizontalSpace(10),
                  Text(
                    " : اسم الطبيب",
                    style: AppTextStyles.jannat18BoldPrimaryColor(context),
                  ),
                ],
              ),
            ), //${}
            verticleSpace(20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TimeAndDateShape(
                date: model.day,
                time: model.time,
              ),
            ),
            verticleSpace(20)
          ],
        ),
      ),
    );
  }
}
