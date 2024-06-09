import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class PatientDatabase {
  PatientDatabase._();
  static saveDoctor(BookModel model) {
    try {
      String strModel = jsonEncode(model.toJson());

      var box = Hive.box(DatabaseConstants.patientDoctorsListBoxKey);
      box.put(model.doctorId, strModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static deleteDoctor(BookModel model) {
    try {
      var box = Hive.box(DatabaseConstants.patientDoctorsListBoxKey);
      box.delete(model.doctorId);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<bool> isDoctorSaved(BookModel model) async{
    var box = Hive.box(DatabaseConstants.patientDoctorsListBoxKey);
    final Iterable<dynamic> list = box.values;

    List<BookModel> books =
        list.map((e) => BookModel.fromJson(jsonDecode(e))).toList();
    bool isSaved =
        books.where((e) => e.doctorId == model.doctorId).isNotEmpty;
        return isSaved;
  }
}
