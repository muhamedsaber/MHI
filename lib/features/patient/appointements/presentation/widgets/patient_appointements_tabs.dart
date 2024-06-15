import 'package:flutter/material.dart';
import 'package:mhi/features/patient/appointements/presentation/widgets/done_appointement/patient_done_appointement_bloc_builder.dart';
import 'package:mhi/features/patient/appointements/presentation/widgets/waiting_appointement/patient_waiting_appointement_bloc_builder.dart';

class PatientAppointementsTabs extends StatelessWidget {
  const PatientAppointementsTabs({super.key, required this.controller});
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: const [
          PatientWaitingAppointementsBlocBuilder(),
          PatientDoneAppointementsBlocBuilder(),
        ],
      ),
    );
  }
}
