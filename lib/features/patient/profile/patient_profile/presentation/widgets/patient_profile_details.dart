
import 'package:flutter/material.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/common_ui/widgets/profile_card.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';

class PatientProfileDetails extends StatefulWidget {
  const PatientProfileDetails({super.key, required this.widget});
  final Widget widget;
  @override
  State<PatientProfileDetails> createState() => _PatientProfileDetailsState();
}

class _PatientProfileDetailsState extends State<PatientProfileDetails> {
  Future<PatientModel?> getUserDataFromCache() async {
    PatientModel? model = await PatientCache().getUser();
    return model;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PatientModel?>(
        future: getUserDataFromCache(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Column(
              children: [
                ProfileCard(
                  gradient: AppThemeing.patientGradient,
                  patientName: snapshot.data?.name ?? "غير متوفر",
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      verticleSpace(30),
                      widget.widget,
                      verticleSpace(20),
                      DataWideShape(
                          title: "اسم المستخدم",
                          value: snapshot.data?.name ?? "غير متوفر"),
                      DataWideShape(
                          title: "تاريخ الميلاد",
                          value: snapshot.data!.birthday.formattedDate),
                      verticleSpace(80),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Column(
              children: [
                ProfileCard(
                  gradient: AppThemeing.patientGradient,
                  patientName: "whfv",
                ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      verticleSpace(20),
                      widget.widget,
                      verticleSpace(20),
                      const DataWideShape(
                          title: "اسم المستخدم", value: "غير متوفر"),
                      const DataWideShape(
                          title: "تاريخ الميلاد", value: "غير متوفر"),
                    ],
                  ),
                ),
                verticleSpace(80),
              ],
            );
          }
        });
  }
}
