import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/custom_hospital_appbar.dart';
import 'package:mhi/core/common_ui/widgets/verified_title.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/patient/mhi/presentation/widgets/health_insurance_subiscribtion_button.dart';
import 'package:mhi/features/patient/mhi/presentation/widgets/main_hospitals_widget.dart';

class PatientMhiView extends StatelessWidget {
  const PatientMhiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       
        children: [
          CustomHospitalAppBar(gradient:AppThemeing.patientGradient,
          hospitalImage: Assets.coloredBackgroundLogo,
          isMainProfile: true
          ),
          verticleSpace(10),
          const VerifiedTitle(
            title: "مصر للتأمين الصحي",
          ),
          verticleSpace(40),
         const MainHospitalsWidget(),
         verticleSpace(50),
        const SubscribeInHealthInsurance()

        ],
      ),
    );
  }
}
