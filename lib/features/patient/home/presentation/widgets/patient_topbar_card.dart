import 'package:flutter/material.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
import 'package:mhi/features/patient/home/presentation/widgets/patient_card_content.dart';

class PatientHomeCard extends StatelessWidget {
  const PatientHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      gradient: AppThemeing.patientGradient,
      widget: FutureBuilder(
          future: PatientCache().getUser(),
          builder: (context, snapshot) {
            if (snapshot.data == null &&
                snapshot.connectionState == ConnectionState.done) {
              // if patient cache deleted or not found then show this message

              Alerts().showCustomToast(
                  message: "يجب إعادة تسجيل الدخول مجدداً",
                  color: AppColors.lightRed);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return PatientCardContent(model: snapshot.data!);
            } else {
              return PatientCardContent(
                  model: PatientModel(
                name: "غير مسجل",
                birthday: "غير مسجل",
                id: "غير مسجل",
                password: "غير مسجل",
                role: "غير مسجل",
                username: "غير مسجل",
                token: "غير مسجل",
                userCode: "غير مسجل",
              ));
            }
          }),
    );
  }
}
