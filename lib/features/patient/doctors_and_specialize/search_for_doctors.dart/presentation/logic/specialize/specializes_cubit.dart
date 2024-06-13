import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/specializes/models/specialize_model.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/specializes/repos/specializes_repo.dart';

part 'specializes_state.dart';
part 'specializes_cubit.freezed.dart';

class SpecializesCubit extends Cubit<SpecializesState> {
  SpecializesCubit({required this.specializesRepository})
      : super(const SpecializesState.initial());
  final SpecializesRepository specializesRepository;
  getSpecializes() async {
    emit(const SpecializesState.loading());
    ApiResult<List<SpecializeModel>> result =
        await specializesRepository.getSpecializes();
    result.when(
      success: (data) {
        emit(SpecializesState.success(data));
      },
      failure: (errorHandler) {
        emit(SpecializesState.error(
            errorHandler.apiErrorModel.message ?? "حدث خطأ ما"));
      },
    );
  }
}
