import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/logic/cubit/doctor_appointements_cubit.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/logic/cubit/doctor_appointements_state.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/widgets/reservation_count_widget.dart';

class TotalAppointmentsBlocBuilder extends StatelessWidget {
  const TotalAppointmentsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAppointementsCubit, DoctorAppointementsState>(
      builder: (context, state) {
        return state.when(
            initial: () => const ReservationCountWidget(totalAppointements: "...."),
            loading: () => const ReservationCountWidget(totalAppointements: "...."),
            error: (error) =>
                const ReservationCountWidget(totalAppointements: "0"),
            success: (data) => ReservationCountWidget(
                totalAppointements: data.appointements.length.toString()));
      },
    );
  }
  //
}
