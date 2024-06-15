import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/features/patient/appointements/presentation/logic/waiting_books/get_patient_waititng_books_dart_cubit.dart';
import 'package:mhi/features/patient/appointements/presentation/logic/waiting_books/get_patient_waititng_books_dart_state.dart';
import 'package:mhi/features/patient/appointements/presentation/widgets/waiting_appointement/waiting_appointements_listview_builder.dart';

class PatientWaitingAppointementsBlocBuilder extends StatefulWidget {
  const PatientWaitingAppointementsBlocBuilder({super.key});

  @override
  State<PatientWaitingAppointementsBlocBuilder> createState() =>
      _PatientWaitingAppointementsBlocBuilderState();
}

class _PatientWaitingAppointementsBlocBuilderState
    extends State<PatientWaitingAppointementsBlocBuilder> {
  @override
  void initState() {
    getIt<GetPatientWaititngBooksDartCubit>().getWaitingBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPatientWaititngBooksDartCubit,
        GetPatientWaititngBooksDartState>(
      builder: (context, state) {
        return state.when(initial: () {
          return const SizedBox.shrink();
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }, loaded: (data) {
          return AppoitnementsListViewBuilder(
            data: data,
          );
        }, error: (error) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: NoDataFound(message: error)),
          );
        });
      },
    );
  }
}

