import 'package:flutter/material.dart';

import 'package:mhi/config/database/local/patient/doctor_database.dart';

import 'package:mhi/core/helper/app_colors.dart';

import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/widgets/doctor_book_card_details.dart';

class DoctorBookCard extends StatefulWidget {
  const DoctorBookCard({super.key, required this.model, this.onTap});
  final DoctorBookData model;
  final Function? onTap;

  @override
  State<DoctorBookCard> createState() => _DoctorBookCardState();
}

class _DoctorBookCardState extends State<DoctorBookCard> {
  bool isDoctorSaved = false;

  @override
  void initState() {
    super.initState();

    getDoctorsSavedDoctorsId();
  }

  Future<void> getDoctorsSavedDoctorsId() async {
    final doctorDatabase = DoctorDatabase();
    final saved = await doctorDatabase.isItemSaved(
        id: widget.model.doctorId!, fromJson: doctorDatabase.fromJson);
    setState(() {
      isDoctorSaved = saved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DoctorBookCardDetails(
      onTap: () async {
        final doctorDatabase = DoctorDatabase();
        if (isDoctorSaved) {
          await doctorDatabase.deleteItem(id: widget.model.doctorId!);
        } else {
          await doctorDatabase.saveItem(
              id: widget.model.doctorId!,
              model: widget.model,
              toJson: doctorDatabase.toJson);
        }
        getDoctorsSavedDoctorsId();
      },
      model: widget.model,
      icon: isDoctorSaved
          ? const Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : const Icon(
              Icons.favorite_border,
              color: AppColors.lighBlue,
            ),
    );
  }
}
