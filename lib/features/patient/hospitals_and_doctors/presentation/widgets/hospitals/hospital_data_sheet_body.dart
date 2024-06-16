import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/data/models/booking_hospital_model.dart';

class HospitalsDataSheetBody extends StatelessWidget {
  const HospitalsDataSheetBody({super.key, required this.hospitalModel});
  final BookingHospitalModel hospitalModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          color: context.theme.scaffoldBackgroundColor),
      child: Column(
        children: [
          verticleSpace(10),
          AppThemeing.dragHandle(context),
          verticleSpace(10),
          DataWideShape(
              title: "اسم المستشفي", value: hospitalModel.name ?? "غير معروف"),
          verticleSpace(10),
          DataWideShape(
              title: "العنوان", value: hospitalModel.address ?? "غير معروف"),
          verticleSpace(10),
          DataWideShape(
              title: "كود المستشفي", value: hospitalModel.code ?? "غير معروف"),
        ],
      ),
    );
  }
}
