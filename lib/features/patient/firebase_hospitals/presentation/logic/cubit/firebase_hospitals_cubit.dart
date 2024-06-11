import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/networking/firebase/firebase_result.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/models/firebase_hospital_model.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/repo/firebase_hospitals_repo.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/logic/cubit/firebase_hospitals_state.dart';

class FirebaseHospitalsCubit extends Cubit<FirebaseHospitalsState> {
  FirebaseHospitalsCubit({required this.firebaseHospitalRepo})
      : super(const FirebaseHospitalsState.initial());
  List<FireBaseHospitalsModel> allHospitals = [];

  FirebaseHospitalRepo firebaseHospitalRepo;
  getAllHospitals() async {
    emit(const FirebaseHospitalsState.loading());
    FirebaseResult<List<FireBaseHospitalsModel>> hospitals =
        await firebaseHospitalRepo.getAllHospitals();
    hospitals.when(success: (data) {
      allHospitals = data;
      emit(FirebaseHospitalsState.loaded(data));
    }, failure: (message) {
      emit(FirebaseHospitalsState.error(
          message.fireBaseErrorModel.message ?? "حدث خطأ ما"));
    });
  }

  filterHospitals(String? query) async {
    List<FireBaseHospitalsModel> filteredHospitals = [];
    emit(const FirebaseHospitalsState.loading());
    if (query.isNullOrEmpty()) {
      emit(FirebaseHospitalsState.loaded(allHospitals));
    }
    filteredHospitals =
        allHospitals.where((e) => e.name!.contains(query!)).toList();
    emit(FirebaseHospitalsState.loaded(filteredHospitals));
  }
}
