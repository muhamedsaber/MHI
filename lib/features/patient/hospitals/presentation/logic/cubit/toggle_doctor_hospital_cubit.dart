

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/cubit/toggle_doctor_hospital_state.dart';

class ToggleDoctorHospitalCubit extends Cubit<ToggleDoctorHospitalState> {
  ToggleDoctorHospitalCubit() : super(ToggleShowHospitals());

  showHospitals(){
    emit(ToggleShowHospitals());
  }
  hideHospital(){
    emit(ToggleHideHospitals());
  }
}
