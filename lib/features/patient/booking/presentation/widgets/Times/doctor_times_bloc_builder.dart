import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/patient/booking/presentation/logic/times/cubit/get_doctor_times_cubit.dart';
import 'package:mhi/features/patient/booking/presentation/logic/times/cubit/get_doctor_times_state.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/Times/doctor_times_listview_builder.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/Times/doctor_times_shimmer.dart';

class DoctorTimesBlocBuilder extends StatelessWidget {
  const DoctorTimesBlocBuilder({super.key,
  
  required this.onTimeSelected
  });
final Function(String) onTimeSelected;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorTimesCubit, GetDoctorTimesState>(
        builder: (context, state) {
      return state.when(initial: () {
        return const SizedBox.shrink();
      }, loading: () {
        return const Center(
          child: DoctorTimesShimmer(),
        );
      }, loaded: (times) {
        return times.isEmpty
            ? const NoDataFound(message: "لا يوجد أوقات متاحة")
            : DoctorTimesListViewBuilder(times: times,onTimeSelected:onTimeSelected,);
      }, error: (errorMessage) {
        return NoDataFound(message: errorMessage);
      });
    });
  }
}
