import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/repos/get_all_doctors_repo.dart';

part 'book_doctors_state.dart';

class BookDoctorsCubit extends Cubit<BookDoctorsState> {
  BookDoctorsCubit({required this.getAllDoctorsRepo})
      : super(BookDoctorsInitial());
  final GetAllDoctorsRepo getAllDoctorsRepo;
  getAllDoctors() async {
    emit(BookDoctorsLoading());
    ApiResult<BookDoctorsModel> response =
        await getAllDoctorsRepo.getAllDoctors();
    response.when(success: (BookDoctorsModel doctors) {
      emit(BookDoctorsLoaded(doctors: doctors));
    }, failure: (error) {
      log(error.apiErrorModel.message ?? "حدث خطأ ما");
      emit(BookDoctorsError(
          message: error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }
}
