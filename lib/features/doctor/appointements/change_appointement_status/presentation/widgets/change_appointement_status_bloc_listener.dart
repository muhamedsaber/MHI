import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/presentation/logic/cubit/change_appointement_status_cubit.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/presentation/logic/cubit/change_appointement_status_state.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/logic/cubit/doctor_appointements_cubit.dart';

class ChangeAppointementStatusBlocListener extends StatelessWidget {
  const ChangeAppointementStatusBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeAppointementStatusCubit,
        ChangeAppointementStatusState>(
      listener: (context, state) {
        state.when(
          initial: () => const SizedBox.shrink(),
          loading: () {
            Alerts().showCustomToast(
                message: "..جاري التحميل", color: AppColors.lighBlue);
          },
          success: (message) {
            Alerts()
                .showCustomToast(message: message, color: AppColors.lightGreen);
            context.read<DoctorAppointementsCubit>().getDoctorAppointements();
          },
          error: (error) {
            Alerts().showCustomToast(message: error, color: AppColors.lightRed);
            context.read<DoctorAppointementsCubit>().getDoctorAppointements();
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
