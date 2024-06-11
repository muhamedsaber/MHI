
import 'package:flutter/material.dart';
import 'package:mhi/features/common/records/data/models/patient_record_model.dart';
import 'package:mhi/features/common/records/presentation/widgets/record_content.dart';

class PatientRecordsListView extends StatefulWidget {
  const PatientRecordsListView({super.key, required this.data});
  final List<PatientRecordModel> data;
  @override
  State<PatientRecordsListView> createState() => _PatientRecordsListViewState();
}

class _PatientRecordsListViewState extends State<PatientRecordsListView> {
 
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: UserRecordContent(record: widget.data[index]),
          );
        },
      ),
    );
  }
}
