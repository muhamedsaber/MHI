import 'package:flutter/material.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/doctor/home/presentation/widgets/doctor_card_content.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      gradient: AppThemeing.doctorGradient,
      widget: FutureBuilder(
          future: DoctorCache().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return DoctorCardContent(model: snapshot.data!);
            } else {
              return DoctorCardContent(
                  model: DoctorModel(
                name: "غير مسجل",
              ));
            }
          }),
    );
  }
}
