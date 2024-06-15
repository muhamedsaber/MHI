import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/features/patient/appointements/presentation/logic/done_books/get_patinet_done_books_cubit.dart';
import 'package:mhi/features/patient/appointements/presentation/logic/done_books/get_patinet_done_books_state.dart';
import 'package:mhi/features/patient/appointements/presentation/widgets/waiting_appointement/waiting_appointements_listview_builder.dart';

class PatientDoneAppointementsBlocBuilder extends StatefulWidget {
  const PatientDoneAppointementsBlocBuilder({super.key});

  @override
  State<PatientDoneAppointementsBlocBuilder> createState() =>
      _PatientDoneAppointementsBlocBuilderState();
}

class _PatientDoneAppointementsBlocBuilderState
    extends State<PatientDoneAppointementsBlocBuilder> {
  @override
  void initState() {
    getIt<GetPatinetDoneBooksCubit>().getDoneAppointements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPatinetDoneBooksCubit, GetPatinetDoneBooksState>(
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
          return Center(child: NoDataFound(message: error));
        });
      },
    );
  }
}
