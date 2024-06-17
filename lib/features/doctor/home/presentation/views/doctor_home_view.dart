import 'package:flutter/material.dart';
import 'package:mhi/features/doctor/home/presentation/widgets/doctor_card.dart';

class DoctorHomeView extends StatelessWidget {
  const DoctorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          DoctorCard()
        ],
      ),
    );
  }
}