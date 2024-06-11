import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/repos/get_all_doctors_repo.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/repos/get_doctor_by_specialize.dart';

part 'book_doctors_state.dart';

class BookDoctorsCubit extends Cubit<BookDoctorsState> {
  BookDoctorsCubit(
      {required this.getAllDoctorsRepo, required this.getDoctorBySpecialize})
      : super(BookDoctorsInitial());
  final GetAllDoctorsRepo getAllDoctorsRepo;
  final GetDoctorBySpecialize getDoctorBySpecialize;
  late BookDoctorsModel _allDoctors;
  

  /// Get [doctors] by [specializeId] and emit the state
  /// [BookDoctorsLoading] -> [BookDoctorsLoaded] -> [BookDoctorsError]
  getDoctorsBySpezialideId({required String specializeId}) async {
    emit(BookDoctorsLoading());
    ApiResult<BookDoctorsModel> model = await getDoctorBySpecialize
        .getDoctorsBySpecialize(specializeID: specializeId);
    model.when(success: (BookDoctorsModel doctors) {
      emit(BookDoctorsLoaded(doctors: doctors));
    }, failure: (error) {
      log(error.apiErrorModel.message ?? "حدث خطأ ما");
      emit(BookDoctorsError(
          message: error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }
  

  /// Get [allDoctors] and emit the state
  /// [BookDoctorsLoading] -> [BookDoctorsLoaded] -> [BookDoctorsError]
  getAllDoctors() async {
    emit(BookDoctorsLoading());
    ApiResult<BookDoctorsModel> response =
        await getAllDoctorsRepo.getAllDoctors();
    response.when(success: (BookDoctorsModel doctors) {
      _allDoctors = doctors; // Store the original list
      emit(BookDoctorsLoaded(doctors: doctors));
    }, failure: (error) {
      log(error.apiErrorModel.message ?? "حدث خطأ ما");
      emit(BookDoctorsError(
          message: error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }



/// Filter [doctors] by [input] and emit the state
  filterDoctors({required String? input}) {
    if (input == null || input.isEmpty) {
      emit(BookDoctorsLoaded(doctors: _allDoctors));
    } else {
      List<DoctorBookData> filteredDoctors = _allDoctors.doctors
          .where(
            (element) => element.name!.contains(input),
          )
          .toList();
      emit(BookDoctorsLoaded(
          doctors: BookDoctorsModel(doctors: filteredDoctors)));
    }
  }
}
