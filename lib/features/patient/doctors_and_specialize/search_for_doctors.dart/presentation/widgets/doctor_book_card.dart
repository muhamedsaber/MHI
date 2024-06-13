import 'package:flutter/material.dart';

import 'package:mhi/config/database/local/patient/doctor_database.dart';

import 'package:mhi/core/helper/app_colors.dart';

import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/doctor_book_card_details.dart';

class DoctorBookCard extends StatefulWidget {
  const DoctorBookCard({super.key, required this.doctor, this.onTap});
  final DoctorBookData doctor;
  final Function? onTap;

  @override
  State<DoctorBookCard> createState() => _DoctorBookCardState();
}

class _DoctorBookCardState extends State<DoctorBookCard> {
  bool isSaved = false;
  late DoctorDatabase doctorDatabase;
  @override
  void initState() {
    super.initState();
    doctorDatabase = DoctorDatabase();
    isDoctorSaved();
  }

  @override
  Widget build(BuildContext context) {
    return DoctorBookCardDetails(
        onFavoriteIconTapped: onFavoriteIconTapped,
        model: widget.doctor,
        icon: _buildTheFavoritIcon());
  }

  /// [isDoctorSaved] This Function is responsible for checking if the Doctor is saved or not
  /// and also if The doctor Saved then the [ColoredIconButton] will be colored with red color
  /// by Changing the [isSaved] value to true

  Future<void> isDoctorSaved() async {
    final saved = await doctorDatabase.isItemSaved(
        id: widget.doctor.doctorId!, fromJson: doctorDatabase.fromJson);
    setState(() {
      isSaved = saved;
    });
  }

  /// if The Doctor Already Saved in the patient Database
  /// then when patient press on the [ColoredIconButton] the Doctor will be removed from the Database
  /// else the Doctor will be saved in the Database
  ///

  onFavoriteIconTapped() async {
    if (isSaved) {
      await doctorDatabase.deleteItem(id: widget.doctor.doctorId!);
    } else {
      await doctorDatabase.saveItem(
        id: widget.doctor.doctorId!,
        model: widget.doctor,
        toJson: doctorDatabase.toJson,
      );
    }

    /// refresh the UI to show the changes if [Patient] saved doctor or removed it
    isDoctorSaved();
  }

  /// [buildTheFavoritIcon] This Function is responsible for building the [ColoredIconButton]
  /// if the Doctor is saved then the [ColoredIconButton] will be colored with red color
  /// else the [ColoredIconButton] will be colored with the default color
  Icon _buildTheFavoritIcon() {
    return isSaved
        ? const Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : const Icon(
            Icons.favorite_border,
            color: AppColors.lighBlue,
          );
  }
}
