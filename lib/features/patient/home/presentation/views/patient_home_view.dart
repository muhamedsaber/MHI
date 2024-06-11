import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_padding.dart';

import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/home/presentation/widgets/firebase_hospitals.dart';

import 'package:mhi/features/patient/home/presentation/widgets/patient_topbar_card.dart';
import 'package:mhi/features/patient/home/presentation/widgets/search_for_doctor_card.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const PatientHomeCard(),
        verticleSpace(60),
        const SearchForDoctorsHomeView(),
        verticleSpace(30),
        const HospitalsHomeView()
      ],
    ));
  }
}
