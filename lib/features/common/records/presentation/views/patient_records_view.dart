import 'package:flutter/material.dart';

import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/search_textfield.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_cubit.dart';
import 'package:mhi/features/common/records/presentation/widgets/patient_record_bloc_builder.dart';
import 'package:mhi/features/common/records/presentation/widgets/sorting_records_menu_button.dart';

class PatientRecordView extends StatefulWidget {
  const PatientRecordView({super.key, required this.patientId});

  final String patientId;
  @override
  State<PatientRecordView> createState() => _PatientRecordViewState();
}

class _PatientRecordViewState extends State<PatientRecordView> {
  @override
  void initState() {
    getPatientRecords();
    super.initState();
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
                SortingRecordsMenuButton(
                    getAllRecordsRecords: getPatientRecords),
                Expanded(
                  child: SearchTextField(
                      controller: TextEditingController(),
                      hintText: "ابحث عن سجل طبي",
                      onChanged: searchForRecords),
                ),
                horizontalSpace(4),
              ],
            ),
            verticleSpace(10),
            const PatientRecordBlocBuilder(),
          ],
        ));
  }

  // triggering the cubit to filter the RecordsList
  searchForRecords(String? input) {
    getIt<PatientRecordCubit>().filterRecords(input);
  }

  // triggering the cubit to get all the RecordsList
  getPatientRecords() async {
    getIt<PatientRecordCubit>()
        .getPatientRecordsFromApi(patientId: widget.patientId);
  }
}
