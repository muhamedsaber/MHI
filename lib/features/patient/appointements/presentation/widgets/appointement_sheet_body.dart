import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/common_ui/widgets/time_and_date_shape.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/appointements/data/models/patient_appointement_model.dart';

class AppointetmentSheetBody extends StatelessWidget {
  const AppointetmentSheetBody({super.key, required this.model});
  final PatientAppointmentModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        color: context.theme.scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          verticleSpace(10),
          Container(
            height: 5.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onSurface.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          verticleSpace(10),
          Expanded(
              child: ListView(
            children: [
              verticleSpace(10),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:20.w),
                child: TimeAndDateShape(
                  date: model.day,
                  time: model.time,
                ),
              ),
              verticleSpace(20),
              DataWideShape(
                  title: "اسم الطبيب",
                  value: model.doctorID?.name ?? "غير معرف"),
              DataWideShape(
                  title: "تخصص الطبيب",
                  value: model.doctorID?.specialize?.name ?? "غير معرف"),
                     DataWideShape(
                  title: "كود الطبيب",
                  value: model.doctorID?.code ?? "غير معرف"), 
              DataWideShape(
                  title: "اسم المستشفي",
                  value: model.doctorID?.hospitalID?.name ?? "غير معرف"),
                 DataWideShape(
                  title: "عنوان المستشفي",
                  value: model.doctorID?.hospitalID?.address ?? "غير معرف"), 
                
              
            ],
          ))
        ],
      ),
    );
  }
}
