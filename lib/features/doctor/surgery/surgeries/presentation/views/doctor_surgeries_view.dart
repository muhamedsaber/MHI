import 'package:flutter/material.dart';
import 'package:mhi/features/doctor/surgery/surgeries/presentation/widgets/doctor_surgeries_appbar.dart';
import 'package:mhi/features/doctor/surgery/surgeries/presentation/widgets/surgery_bloc_builder.dart';

class DoctorSurgeriesView extends StatefulWidget {
  const DoctorSurgeriesView({super.key});

  @override
  State<DoctorSurgeriesView> createState() => _DoctorSurgeriesViewState();
}

class _DoctorSurgeriesViewState extends State<DoctorSurgeriesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          DoctorSurgeriesAppBar(),
          SurgeriesBlocBuilder(),
        ],
      ),
    );
  }
}
