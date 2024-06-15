import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/common/records/data/models/patient_record_model.dart';
import 'package:mhi/features/common/records/presentation/widgets/record_data_shape.dart';

class UserRecordContent extends StatelessWidget {
  const UserRecordContent({super.key, required this.record});
  final PatientRecordModel record;

  Widget _buildRecordDataShape(String? title, String? value) {
    if (value == null || value.isEmpty || value == "null") {
      return const SizedBox.shrink();
    }
    return RecordsDataShape(
      title: title ?? "غير معرف",
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              for (DiagnoseData item in record.diagnose ?? [])
                _buildRecordDataShape(item.medicine ?? "غير معرف",
                    item.description ?? "غير معرف"),
              _buildRecordDataShape("الطبيب", record.doctor?.name),
              _buildRecordDataShape(
                  "التخصص", record.doctor?.specialize?.name ?? "غير معرف"),
              _buildRecordDataShape(
                  "المستشفى", record.doctor?.hospitalID?.name ?? "غير معرف"),
              _buildRecordDataShape(
                  "اسم المريض", record.patient?.name ?? "غير معرف"),
              _buildRecordDataShape(
                  "تاريخ الميلاد", record.patient?.birthday.formattedDate),
              _buildRecordDataShape(
                  "تاريخ التقرير", record.date?.formattedDate ?? "غير معرف"),
            ],
          ),
        ),
      ],
    );
  }
}
