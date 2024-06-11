import 'package:mhi/config/database/local/patient/patient_base_database.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/features/common/records/data/models/patient_record_model.dart';

class PatientRecordDatabase extends BaseDatabase<PatientRecordModel>{
  PatientRecordDatabase() : super(DatabaseConstants.patientRecordsListBoxKey);
 PatientRecordModel fromJson(Map<String, dynamic> json) => PatientRecordModel.fromJson(json);
  Map<String, dynamic> toJson(PatientRecordModel model) => model.toJson();

  
   
}