import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/features/doctor/surgery/surgeries/data/models/surgery_model.dart';
import 'package:mhi/features/doctor/surgery/surgeries/presentation/widgets/surgery_card.dart';

class SurgeryListViewBuilder extends StatelessWidget {
  const SurgeryListViewBuilder({super.key, required this.surgeries});
  final List<SurgeryModel> surgeries;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 50.h),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: surgeries.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: SurgeryCard(
                surgery: surgeries[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
