import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/widgets/surgery_hospitals_listview.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/hospitals/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/hospitals/all_hospitals_state.dart';

class SurgeryHospitalsBlocBuilder extends StatelessWidget {
  const SurgeryHospitalsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllHospitalsCubit, AllHospitalsState>(
      builder: (context, state) {
        return state.when(initial: () {
          return const SizedBox.shrink();
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }, loaded: (data) {
          return SurgeryHospitalsListView(hospitals: data);
        }, error: (error) {
          return Padding(
            padding: AppPadding.symmetricHorizontalMedium,
            child: NoDataFound(
              message: error,
              icon: Icons.error,
            ),
          );
        });
      },
    );
  }
}
