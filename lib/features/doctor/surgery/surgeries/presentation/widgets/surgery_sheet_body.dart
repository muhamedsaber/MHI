import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/common_ui/widgets/time_and_date_shape.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/doctor/surgery/surgeries/data/models/surgery_model.dart';

class SurgerySheetBody extends StatelessWidget {
  const SurgerySheetBody({super.key, required this.model});
  final SurgeryModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      width: context.width,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
        
      )),
      child: Column(
        children: [
          verticleSpace(10),
          AppThemeing.dragHandle(context),
          verticleSpace(10),
          DataWideShape(
              title: "اسم المريض", value: model.patient?.name ?? "غير معرف"),
                DataWideShape(
              title: "اسم المستخدم",
              value: model.patient?.username ?? "غير معرف"),
          DataWideShape(
              title: "تاريخ ميلاد المريض",
              value: model.patient?.birthday.formattedDate ?? "غير معرف"),
        
              verticleSpace(10),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:20.w),
                child: TimeAndDateShape(date: model.day, time: model.time),
              ),
        ],
      ),
    );
  }
}