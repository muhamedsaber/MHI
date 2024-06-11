import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_cubit.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_state.dart';
import 'package:mhi/features/common/records/presentation/views/patient_records_view.dart';
import 'package:mhi/features/common/records/presentation/widgets/record_content.dart';
import 'package:mhi/features/common/records/presentation/widgets/shimer_record_content.dart';

class PatientRecordBlocBuilder extends StatelessWidget {
  const PatientRecordBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientRecordCubit, PatientRecordState>(
      builder: (context, state) => state.when(initial: () {
        return const SizedBox.shrink();
      }, loading: () {
        return Expanded(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return const ShimmerRecordContent();
            },
          ),
        );
      }, loaded: (data) {
        return data.isEmpty
            ? const NoDataFound(
                message: "لا يوجد سجلات طبية",
                icon: Icons.medical_information,
              )
            : Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return UserRecordContent(record: data[index]);
                  },
                ),
            );
      }, error: (error) {
        return Center(child: Text(error));
      }),
    );
  }
}
