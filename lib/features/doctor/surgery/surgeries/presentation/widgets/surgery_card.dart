import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/time_and_date_shape.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/doctor/surgery/surgeries/data/models/surgery_model.dart';
import 'package:mhi/features/doctor/surgery/surgeries/presentation/widgets/surgery_sheet_body.dart';

class SurgeryCard extends StatelessWidget {
  const SurgeryCard({super.key, required this.surgery});
  final SurgeryModel surgery;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          builder: (context) {
            return SurgerySheetBody(
              model: surgery,
            );
          },
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                surgery.patient?.username ?? "غير معرف",
                style: AppTextStyles.jannat20BoldWhite
                    .copyWith(color: context.theme.colorScheme.onSurface),
              ),
              verticleSpace(10),
              TimeAndDateShape(date: surgery.day, time: surgery.time),
            ],
          ),
        ),
      ),
    );
  }
}
