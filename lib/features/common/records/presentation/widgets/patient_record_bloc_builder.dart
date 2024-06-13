import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_cubit.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_state.dart';
import 'package:mhi/features/common/records/presentation/widgets/patient_record_data_listview.dart';
import 'package:mhi/features/common/records/presentation/widgets/shimmer_records_listview_builder.dart';

class PatientRecordBlocBuilder extends StatelessWidget {
  const PatientRecordBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientRecordCubit, PatientRecordState>(
      builder: (context, state) => state.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const ShimmerRecordListViewBuilder(),
        loaded: (data) => PatientRecordsListView(data: data),
        error: (error) =>
            NoDataFound(message: error, icon: Icons.error_outline),
      ),
    );
  }
}
