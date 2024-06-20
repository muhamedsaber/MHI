import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/widgets/doctor_appointement_card.dart';

class DoctorAppointementsListViewBuilder extends StatelessWidget {
  const DoctorAppointementsListViewBuilder(
      {super.key, required this.appointements});
  final DoctorAppointements appointements;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(bottom: 50.h),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: appointements.appointements.length,
          itemBuilder: (context, index) {
            if (appointements.appointements.isEmpty) {
              return const Center(
                child: NoDataFound(
                  message: "لا يوجد مواعيد اليوم",
                  icon: Icons.calendar_month,
                ),
              );
            } else {
              return DoctorAppointementCard(
                model: appointements.appointements[index],
              );
            }
          },
        ),
      ),
    );
  }
}
