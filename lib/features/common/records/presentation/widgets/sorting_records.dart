import 'package:flutter/material.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_cubit.dart';

class SortingRecords extends StatelessWidget {
  const SortingRecords({super.key, required this.getAllRecordsRecords});
  final void Function() getAllRecordsRecords;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Icon(
        Icons.sort,
        color: context.theme.colorScheme.onSurface,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: getAllRecordsRecords,
            value: "الكل",
            child: Text(
              "الكل",
              style: AppTextStyles.jannat18BoldPrimaryColor(context),
            ),
          ),
          PopupMenuItem(
            onTap: () {
              getIt<PatientRecordCubit>().sortFromOldestToNewest();
              Alerts().showCustomToast(
                  message: "تم ترتيب السجلات الطبية",
                  color: AppColors.lightGreen);
            },
            value: "من الأقدم إلى الأحدث",
            child: Text(
              "من الأقدم إلى الأحدث",
              style: AppTextStyles.jannat18BoldPrimaryColor(context),
            ),
          ),
          PopupMenuItem(
            onTap: () {
              getIt<PatientRecordCubit>().sortFromNewestToOldest();
              Alerts().showCustomToast(
                  message: "تم ترتيب السجلات الطبية",
                  color: AppColors.lightGreen);
            },
            value: "من الأحدث إلى الأقدم",
            child: Text(
              "من الأحدث إلى الأقدم",
              style: AppTextStyles.jannat18BoldPrimaryColor(context),
            ),
          ),
        ];
      },
    );
  }
}
