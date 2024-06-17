import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/common_ui/widgets/profile_card.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';

class PatientInformationData extends StatelessWidget {
  const PatientInformationData(
      {super.key, required this.model, required this.widget});
  final PatientModel model;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCard(
          gradient: AppThemeing.patientGradient,
          username: model.name ?? "غير متوفر",
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              verticleSpace(30),
              widget,
              verticleSpace(20),
              DataWideShape(
                  title: "اسم المستخدم", value: model.name ?? "غير متوفر"),
              DataWideShape(
                  title: "تاريخ الميلاد",
                  value: model.birthday?.formattedDate ?? "غير متوفر"),
              DataWideShape(
                title: "الوزن",
                value: model.weight ?? "غير متوفر",
              ),
              DataWideShape(
                title: "الطول",
                value: model.height ?? "غير متوفر",
              ),
              DataWideShape(
                title: "فصيلة الدم",
                value: model.bloodType ?? "غير متوفر",
              ),
              DataWideShape(
                title: "رقم الهاتف",
                value: model.mobileNumber ?? "غير متوفر",
              ),
              DataWideShape(
                title: "العنوان",
                value: model.address ?? "غير متوفر",
              ),
              verticleSpace(100),
            ],
          ),
        ),
      ],
    );
  }
}
