import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/search_textfield.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/common/medicines/mhi_medicines/presentation/Logic/mhi_medicines/cubit/mhi_medicines_cubit.dart';
import 'package:mhi/features/common/medicines/mhi_medicines/presentation/widgets/mhi_medicine_bloc_builder.dart';

class MhiMedicineView extends StatefulWidget {
  const MhiMedicineView({super.key});

  @override
  State<MhiMedicineView> createState() => _MhiMedicineViewState();
}

class _MhiMedicineViewState extends State<MhiMedicineView> {
  @override
  void initState() {
    getIt<MhiMedicinesCubit>().getMedicines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(context: context, title: "الأدوية"),
      body: Column(
        children: [
          verticleSpace(10),
          SearchTextField(
              controller: TextEditingController(),
              hintText: "ادخل اسم الدواء",
              onChanged: (input) {
                getIt<MhiMedicinesCubit>().filterMdicines(input);
              }),
          verticleSpace(10),
          const MhiMedicineBlocBuilder()
        ],
      ),
    );
  }
}
