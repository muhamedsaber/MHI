import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/widgets/request_new_surgey_form.dart';

class RequestNewSurgeryView extends StatelessWidget {
  const RequestNewSurgeryView({super.key, required this.model});
  final DoctorAppointementModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder(context: context, title: "طلب عملية جديدة"),
        body: RequestNewSurgeryForm(
          model: model,
        ));
  }
}


