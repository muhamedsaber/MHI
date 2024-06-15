import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/appointement_shape.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/patient/appointements/data/models/patient_appointement_model.dart';
import 'package:mhi/features/patient/appointements/presentation/widgets/appointement_sheet_body.dart';

class AppoitnementsListViewBuilder extends StatelessWidget {
  const AppoitnementsListViewBuilder({super.key, required this.data});
  final List<PatientAppointmentModel> data;
  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? const Center(
            child: NoDataFound(message: "لا توجد مواعيد "),
          )
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return AppointemtntShape(
                model: data[index],
                enableOnTap: true,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: true,
                    builder: (context) => AppointetmentSheetBody(
                      model: data[index],
                    ),
                  );
                },
              );
            },
          );
  }
}

