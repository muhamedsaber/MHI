import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/widgets/create_new_record_bloc_listener.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/widgets/new_record_form.dart';

class CreateNewRecordView extends StatelessWidget {
  const CreateNewRecordView({super.key, required this.model});
  final DoctorAppointementModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(context: context, title: "إنشاء تقرير جديد"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            NewRecordForm(
              model: model,
            ),
            const CreateNewRecordBlocListener()
          ],
        ),
      ),
    );
  }
}

