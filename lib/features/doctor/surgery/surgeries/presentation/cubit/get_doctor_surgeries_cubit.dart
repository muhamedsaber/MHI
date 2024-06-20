import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/doctor/surgery/surgeries/data/repos/get_doctor_surgeries_repo.dart';
import 'package:mhi/features/doctor/surgery/surgeries/presentation/cubit/get_doctor_surgeries_state.dart';

class GetDoctorSurgeriesCubit extends Cubit<GetDoctorSurgeriesState> {
  GetDoctorSurgeriesCubit({
    required this.repo
  }) : super(const GetDoctorSurgeriesState.initial());

  final GetDoctorSurgeriesRepo repo;

  Future<String> _getDoctorId() async {
    DoctorModel? model = await DoctorCache().getUser();
    return model?.id ?? "";
  }

  Future<void> getDoctorSurgeries() async {
    emit(const GetDoctorSurgeriesState.loading());
    String doctorId = await _getDoctorId();
    var result = await repo.getSurgeries(doctorId: doctorId);

    result.when(
      success: (response) {
        emit(GetDoctorSurgeriesState.success(response));
      },
      failure: (error) {
        emit(GetDoctorSurgeriesState.error(
            error.apiErrorModel.message ?? "حدث خطأ ما"));
      },
    );
  }
}
