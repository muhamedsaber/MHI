import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
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
    return widget.data.isEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: const NoDataFound(
              message: "لا يوجد سجلات طبية",
              icon: Icons.medical_information,
            ),
          )
        : Expanded(
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
