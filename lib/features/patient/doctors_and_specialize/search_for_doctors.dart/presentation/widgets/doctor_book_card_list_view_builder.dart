import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';

import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/doctor_book_card.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/doctor_book_profile.dart';

class DoctorBookCardListViewBuilder extends StatelessWidget {
  const DoctorBookCardListViewBuilder({super.key, required this.model});
  final BookDoctorsModel model;
  @override
  Widget build(BuildContext context) {
    return model.doctors.isEmpty
        ? const Expanded(
            child: SingleChildScrollView(
              child: NoDataFound(
                message: "لم يتم العثور علي أطباء",
                icon: Icons.error_outline,
              ),
            ),
          )
        : Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: model.doctors.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return DoctorBookingProfile(
                              model: model.doctors[index],
                            );
                          });
                    },
                    child: DoctorBookCard(
                      doctor: model.doctors[index],
                    ));
              },
            ),
          );
  }
}
