
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/models/firebase_hospital_model.dart';
part 'firebase_hospitals_state.freezed.dart';
@freezed
class FirebaseHospitalsState with _$FirebaseHospitalsState {
  const factory FirebaseHospitalsState.initial() = _Initial;
  const factory FirebaseHospitalsState.loading() = _Loading;
  const factory FirebaseHospitalsState.loaded(List<FireBaseHospitalsModel> hospitals) = _Loaded;
  const factory FirebaseHospitalsState.error(String message) = _Error;

}
