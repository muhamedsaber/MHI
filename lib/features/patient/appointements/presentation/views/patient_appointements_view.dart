import 'package:flutter/material.dart';
import 'package:mhi/features/patient/appointements/presentation/widgets/patient_appointement_appbar.dart';
import 'package:mhi/features/patient/appointements/presentation/widgets/patient_appointements_tabs.dart';

class PatientAppointementView extends StatefulWidget {
  const PatientAppointementView({super.key});

  @override
  State<PatientAppointementView> createState() =>
      _PatientAppointementViewState();
}

class _PatientAppointementViewState extends State<PatientAppointementView>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        PatientAppointementAppbar(
          tabController: controller,
        ),
        PatientAppointementsTabs(controller:controller,)
      ],
    ));
  }
}
