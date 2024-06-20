import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/doctor/appointements/books_count/data/models/doctor_books_count_response_body.dart';
import 'package:mhi/features/doctor/appointements/books_count/data/repos/doctor_books_count_repo.dart';
import 'package:mhi/features/doctor/appointements/books_count/presentation/Logic/cubit/doctor_books_count_state.dart';

class DoctorBooksCountCubit extends Cubit<DoctorBooksCountState> {
  DoctorBooksCountCubit(this.repo)
      : super(const DoctorBooksCountState.initial());

  Future<String> _getDoctorId() async {
    DoctorModel? model = await DoctorCache().getUser();
    return model?.id ?? "";
  }

  final DoctorBooksCountRepo repo;
  getBooksCount() async {
    emit(const DoctorBooksCountState.loading());
    String id = await _getDoctorId();
    ApiResult<DoctorBooksCountResponseBody> result =
        await repo.getBooksCount(id: id);
    result.when(success: (data) {
      emit(DoctorBooksCountState.success(data));
    }, failure: (error) {
      emit(DoctorBooksCountState.error(
          error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }
}
