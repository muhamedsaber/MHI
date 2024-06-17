
import 'package:flutter/material.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
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
              ));
            }
          }),
    );
  }
}
