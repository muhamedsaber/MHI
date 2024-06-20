import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/common/medicines/open_fda/data/models/drug_result.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/views/fda_drug_card.dart';

class FdaDrugsListViewBuilder extends StatelessWidget {
  const FdaDrugsListViewBuilder({super.key, required this.result});
  final DrugResult result;
  @override
  Widget build(BuildContext context) {
    return result.drugs == null || result.drugs?.isEmpty == true
        ? Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: const NoDataFound(
              message: "لم يتم العثور علي دواء",
              icon: Icons.error_outline_rounded,
            ),
          )
        : Expanded(
          child: ListView.builder(
              itemCount: totalLenght(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return result.drugs?[index] == null
                    ? const SizedBox.shrink()
                    : isDrugHaveName(result.drugs?[index])
                        ? FdaDrugCard(drugResult: result.drugs?[index])
                        : const SizedBox.shrink();
              }),
        );
  }

  bool isDrugHaveName(OpenFdaDrugLabel? label) {
    if (label?.openFdaDrugData?.genericName?.first == null &&
        label?.openFdaDrugData?.brandName?.first == null) {
      return false;
    } else {
      return true;
    }
  }

  int totalLenght() {
    int total = 0;
    for (var element in result.drugs ?? []) {
      if (element?.openFdaDrugData?.genericName?.first == null &&
          element?.openFdaDrugData?.brandName?.first == null) {
        total++;
      }
    }
    return total;
  }
  
}
