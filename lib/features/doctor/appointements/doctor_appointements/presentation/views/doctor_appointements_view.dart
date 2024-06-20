import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/presentation/widgets/change_appointement_status_bloc_listener.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/logic/cubit/doctor_appointements_cubit.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/widgets/doctor_appointement_bloc_builder.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/widgets/doctor_appointements_appbar.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/widgets/total_appointment_bloc_builder.dart';

class DoctorAppointementsView extends StatefulWidget {
  const DoctorAppointementsView({super.key});

  @override
  State<DoctorAppointementsView> createState() =>
      _DoctorAppointementsViewState();
}

class _DoctorAppointementsViewState extends State<DoctorAppointementsView> {
  @override
  void initState() {
    getIt<DoctorAppointementsCubit>().getDoctorAppointements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const DoctorAppointementsAppBar(),
        const TotalAppointmentsBlocBuilder(),
        verticleSpace(10),
        Divider(
          thickness: 0.3,
          indent: 20.w,
          endIndent: 20.w,
        ),
        const DoctorAppointementsBlocBuilder(),
        const ChangeAppointementStatusBlocListener()
      ],
    ));
  }
}
