import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/data/repos/hospitals/all_hospitals_repo.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/hospitals/all_hospitals_state.dart';

class AllHospitalsCubit extends Cubit<AllHospitalsState> {
  AllHospitalsCubit({required this.allHospitalsRepo})
      : super(const AllHospitalsState.initial());
  final AllHospitalsRepo allHospitalsRepo;

  getAllHospitals() async {
    emit(const AllHospitalsState.loading());
    final result = await allHospitalsRepo.getAllHospitals();
    result.when(success: (data) {
      emit(AllHospitalsState.loaded(data));
    }, failure: (error) {
      emit(
          AllHospitalsState.error(error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }
}
