import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/data/mhi/models/mhi_medicine_model.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/presentation/widgets/mhi_medicine_sheet.dart';

class MhiMedicineCard extends StatelessWidget {
  const MhiMedicineCard({super.key, required this.medicineData});
  final MhiMedicineData medicineData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return MhiMedicineSheetContent(medicineData: medicineData);
          },
        );
      },
      child: DataWideShape(
          title: medicineData.name ?? "غير معرف",
          value: medicineData.description ?? "غير معرف"),
    );
  }
}
