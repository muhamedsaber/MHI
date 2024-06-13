import 'package:flutter/material.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/home/presentation/widgets/firebase_hospitals.dart';
import 'package:mhi/features/patient/home/presentation/widgets/hospitals_home_view.dart';
import 'package:mhi/features/patient/home/presentation/widgets/patient_topbar_card.dart';
import 'package:mhi/features/patient/home/presentation/widgets/search_for_medicines.dart';
import 'package:mhi/features/patient/home/presentation/widgets/search_for_doctor_card.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const PatientHomeCard(),
        verticleSpace(20),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              verticleSpace(30),
              const AppointmentHomeScreen(),
              verticleSpace(40),
              const SearchForDoctorsHomeView(),
              verticleSpace(60),
              const SearchForMedicineHomeScreen(),
              verticleSpace(30),
              const HospitalsHomeView(),
              verticleSpace(100),
            ],
          ),
        )
      ],
    ));
  }
}
