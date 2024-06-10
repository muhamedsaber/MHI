import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/local/patient/patient_database.dart';
import 'package:mhi/features/patient/saved/presentation/Logic/cubit/saved_doctors_state.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class SavedDoctorsCubit extends Cubit<SavedDoctorsState> {
  SavedDoctorsCubit() : super(SavedDoctorsInitial());
  getSavedDoctors() async {
    emit(SavedDoctorsLoading());
    try {
      List<BookModel> response = await PatientDatabase.getSavedDoctors();

      emit(SavedDoctorsSuccess(doctors: response));
    } catch (e) {
      emit(SavedDoctorsError(message: "حدث خطأ ما"));
    }
  }

  saveDoctor({required BookModel model}) async {
    bool isSaved = await PatientDatabase.saveDoctor(model);
    if (isSaved) {
      emit(DoctorSavedSuccessFully());
    } else {
      emit(SavedDoctorsError(message: "حدث خطأ ما"));
    }
  }

  deleteDoctor({required BookModel model}) async {
    PatientDatabase.deleteDoctor(model);
    emit(DoctorRemovedSuccessFully());
  }
}
