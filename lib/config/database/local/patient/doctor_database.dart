import 'package:mhi/config/database/local/patient/patient_base_database.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class DoctorDatabase extends BaseDatabase<DoctorBookData> {
  DoctorDatabase() : super(DatabaseConstants.patientDoctorsListBoxKey);

  DoctorBookData fromJson(Map<String, dynamic> json) => DoctorBookData.fromJson(json);
  Map<String, dynamic> toJson(DoctorBookData model) => model.toJson();
}