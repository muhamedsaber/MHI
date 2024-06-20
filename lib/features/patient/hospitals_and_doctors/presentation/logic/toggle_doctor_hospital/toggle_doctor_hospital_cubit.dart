

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/toggle_doctor_hospital/toggle_doctor_hospital_state.dart';

class ToggleDoctorHospitalCubit extends Cubit<ToggleDoctorHospitalState> {
  ToggleDoctorHospitalCubit() : super(ToggleShowHospitals());

  showHospitals(){
    emit(ToggleShowHospitals());
  }
  hideHospital(){
    emit(ToggleHideHospitals());
  }
  showSearchHospitalsTextField(){
    emit(ToggleSearchInHospitalsStarts());

  }
  hideSearchHospitalsTextField(){
    emit(ToggleSearchInHospitalsEnds());
  }
}
