import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/common_ui/widgets/profile_card.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/doctor/profile/data/doctor_specialize_detector.dart';

class DoctorInformationData extends StatelessWidget {
  const DoctorInformationData(
      {super.key, required this.model, required this.widget});
  final DoctorModel model;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCard(
          gradient: AppThemeing.doctorGradient,
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
                  title: "المستشفي", value: model.hospitalName ?? "غير متوفر"),
              DataWideShape(
                  title: "التخصص",
                  value: DoctorSpeciaizeDetector.detectSpeciaizeName(
                      model.specialize)),
              verticleSpace(100),
            ],
          ),
        ),
      ],
    );
  }
}
