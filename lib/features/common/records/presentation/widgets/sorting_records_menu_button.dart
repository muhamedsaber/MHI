import 'package:flutter/material.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_cubit.dart';

class SortingRecordsMenuButton extends StatelessWidget {
  const SortingRecordsMenuButton({super.key, required this.getAllRecordsRecords});
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
            value: "عرض الكل",
            child: Text(
              "عرض الكل",
              style: AppTextStyles.jannat18BoldPrimaryColor(context),
            ),
          ),
          PopupMenuItem(
            onTap: sortFromOldestToNewest,
            value: "من الأقدم إلى الأحدث",
            child: Text(
              "من الأقدم إلى الأحدث",
              style: AppTextStyles.jannat18BoldPrimaryColor(context),
            ),
          ),
          PopupMenuItem(
            onTap: sortFromNewestToOldest,
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

  sortFromNewestToOldest() {
    getIt<PatientRecordCubit>().sortFromNewestToOldest();
  }

  sortFromOldestToNewest() {
    getIt<PatientRecordCubit>().sortFromOldestToNewest();
  }
}
