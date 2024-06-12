import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/local/patient/doctor_database.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/Logic/saved_doctors/cubit/saved_doctors_state.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class SavedDoctorsCubit extends Cubit<SavedDoctorsState> {
  SavedDoctorsCubit() : super(SavedDoctorsInitial());

  final doctorDatabase = DoctorDatabase();

  getSavedDoctors() async {
    emit(SavedDoctorsLoading());
    try {
      List<DoctorBookData> response =
          await doctorDatabase.getItems(doctorDatabase.fromJson);
      emit(SavedDoctorsSuccess(doctors: response));
    } catch (e) {
      emit(SavedDoctorsError(message: "حدث خطأ ما"));
    }
  }

  saveDoctor({required DoctorBookData model}) async {
    bool isSaved = await doctorDatabase.saveItem(
      id: model.doctorId!,
      model: model,
      toJson: doctorDatabase.toJson,
    );
    if (isSaved) {
      emit(DoctorSavedSuccessFully());
    } else {
      emit(SavedDoctorsError(message: "حدث خطأ ما"));
    }
  }

  deleteDoctor({required DoctorBookData model}) async {
    await doctorDatabase.deleteItem(id: model.doctorId!);
    getSavedDoctors();
    log("item deleted!");
    _showSuccessToastForDelete();
    emit(DoctorRemovedSuccessFully());
  }

  _showSuccessToastForDelete() {
    Alerts().showCustomToast(
        message: "تم الإزالة من المفضلة", color: AppColors.lightGreen);
  }
}
