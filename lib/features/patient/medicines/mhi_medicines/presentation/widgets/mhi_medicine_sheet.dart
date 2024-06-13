import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/data/mhi/models/mhi_medicine_model.dart';

class MhiMedicineSheetContent extends StatelessWidget {
  const MhiMedicineSheetContent({super.key, required this.medicineData});
  final MhiMedicineData medicineData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: 500.h,
      child: Column(
        children: [
          verticleSpace(10),
          Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          verticleSpace(10),
          Expanded(
              child: ListView(
            children: [
              DataWideShape(title: "الأسم", value: medicineData.name ?? ""),
              verticleSpace(10),
              DataWideShape(
                  title: "الوصف", value: medicineData.description ?? ""),
              verticleSpace(10),
              DataWideShape(
                  title: "العلامة التجارية",
                  value: medicineData.tradeMark ?? ""),
              verticleSpace(10),
              DataWideShape(
                  title: "المكونات", value: medicineData.components ?? ""),
              verticleSpace(10),
              DataWideShape(
                  title: "كيفية الاستخدام", value: medicineData.howToUse ?? ""),
            ],
          ))
        ],
      ),
    );
  }
}
