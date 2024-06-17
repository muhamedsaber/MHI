import 'package:mhi/features/auth/login/data/models/patient_model.dart';

class UpdatedPatientProfileModel extends PatientModel {
  UpdatedPatientProfileModel({
    super.address,
    super.height,
    super.weight,
    super.mobileNumber,
    super.bloodType,
  });

  factory UpdatedPatientProfileModel.fromJson(Map<String, dynamic> json) {
    var getPatient = json["getProfile"];
    return UpdatedPatientProfileModel(
        address: getPatient['address'],
        height: getPatient['height'],
        weight: getPatient['weight'],
        mobileNumber: getPatient['mobileNumber'],
        bloodType: getPatient['bloodType']);
  }
}
