import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:mhi/config/database/local/patient/patient_database.dart';

import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/core/helper/app_colors.dart';

import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/widgets/doctor_book_card_details.dart';

class DoctorBookCard extends StatefulWidget {
  const DoctorBookCard({super.key, required this.model});
  final BookModel model;

  @override
  State<DoctorBookCard> createState() => _DoctorBookCardState();
}

class _DoctorBookCardState extends State<DoctorBookCard> {
  bool isDoctorSaved = false;

  @override
  void initState() {
    super.initState();
    openPatientDoctorsBox().then((_) {
      getDoctorsSavedDoctorsId();
    });
  }

  Future<void> openPatientDoctorsBox() async {
    await Hive.openBox(DatabaseConstants.patientDoctorsListBoxKey);
  }

  Future getDoctorsSavedDoctorsId() async {
    await PatientDatabase.isDoctorSaved(widget.model).then((s) {
      setState(() {
        isDoctorSaved = s;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DoctorBookCardDetails(
      onTap: () {
        if (isDoctorSaved) {
          setState(() {
            PatientDatabase.deleteDoctor(widget.model);
            getDoctorsSavedDoctorsId();
          });
        } else {
          setState(() {
            PatientDatabase.saveDoctor(widget.model);
            getDoctorsSavedDoctorsId();
          });
        }
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
