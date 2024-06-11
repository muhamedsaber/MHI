import 'package:flutter/material.dart';

import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/search_textfield.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_cubit.dart';
import 'package:mhi/features/common/records/presentation/widgets/patient_record_bloc_builder.dart';
import 'package:mhi/features/common/records/presentation/widgets/sorting_records.dart';

class PatientRecordView extends StatefulWidget {
  const PatientRecordView({super.key, required this.patientId});

  final String patientId;
  @override
  State<PatientRecordView> createState() => _PatientRecordViewState();
}

class _PatientRecordViewState extends State<PatientRecordView> {
  @override
  void initState() {
    getRecords();
    super.initState();
  }

  getRecords() async {
    getIt<PatientRecordCubit>()
        .getPatientRecordsFromApi(patientId: widget.patientId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder(context: context, title: "السجلات الطبية"),
        body: Column(
          children: [
            verticleSpace(10),
            Row(
              children: [
                horizontalSpace(20),

                
                SortingRecords(getAllRecordsRecords: getRecords),
                Expanded(
                  child: SearchTextField(
                      controller: TextEditingController(),
                      hintText: "ابحث عن سجل طبي",
                      onChanged: (input) {
                        getIt<PatientRecordCubit>().filterRecords(input);
                      }),
                ),
                horizontalSpace(4),
              ],
            ),
            verticleSpace(10),
            const PatientRecordBlocBuilder(),
          ],
        ));
  }
}
