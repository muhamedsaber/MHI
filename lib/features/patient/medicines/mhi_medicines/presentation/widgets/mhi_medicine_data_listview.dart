import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/data/mhi/models/mhi_medicine_model.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/presentation/widgets/mhi_medicine_card.dart';

class MhiMedicineDataListView extends StatelessWidget {
  const MhiMedicineDataListView({super.key, required this.model});
  final MhiMedicineModel model;
  @override
  Widget build(BuildContext context) {
    return model.medicineData.isEmpty
        ? const NoDataFound(
            message: "لا يوجد أدوية",
          )
        : Expanded(
            child: ListView.builder(
              itemCount: model.medicineData.length,
              itemBuilder: (context, index) {
                return MhiMedicineCard(medicineData: model.medicineData[index]);
              },
            ),
          );
  }
}