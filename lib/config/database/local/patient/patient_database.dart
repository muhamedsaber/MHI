import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class PatientDatabase {
  PatientDatabase._();
  static Future<bool> saveDoctor(BookModel model) async {
    try {
      String strModel = jsonEncode(model.toJson());

      var box = Hive.box(DatabaseConstants.patientDoctorsListBoxKey);
      await box.put(model.doctorId, strModel);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteDoctor(BookModel model) async {
    try {
      var box = Hive.box(DatabaseConstants.patientDoctorsListBoxKey);
      await box.delete(model.doctorId);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> isDoctorSaved(BookModel model) async {
    var box = Hive.box(DatabaseConstants.patientDoctorsListBoxKey);
    final Iterable<dynamic> list = box.values;

    List<BookModel> books =
        list.map((e) => BookModel.fromJson(jsonDecode(e))).toList();
    bool isSaved = books.where((e) => e.doctorId == model.doctorId).isNotEmpty;
    return isSaved;
  }

  static Future<List<BookModel>> getSavedDoctors() async {
    await Hive.openBox(DatabaseConstants.patientDoctorsListBoxKey);
    var box = Hive.box(DatabaseConstants.patientDoctorsListBoxKey);
    final Iterable<dynamic> list = box.values;

    List<BookModel> books =
        list.map((e) => BookModel.fromJson(jsonDecode(e))).toList();
    return books;
  }

  static Future<void> deleteAll() async {
    await Hive.openBox(DatabaseConstants.patientDoctorsListBoxKey);
    var box = Hive.box(DatabaseConstants.patientDoctorsListBoxKey);
    await box.clear();
    print("deleted successfully");
  }
}
