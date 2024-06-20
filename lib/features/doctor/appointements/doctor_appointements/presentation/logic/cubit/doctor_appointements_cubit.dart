
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/repos/doctor_appointements_repo.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/logic/cubit/doctor_appointements_state.dart';

class DoctorAppointementsCubit extends Cubit<DoctorAppointementsState> {
  DoctorAppointementsCubit(this.repo) : super(const DoctorAppointementsState.initial());
 final DoctorAppointementsRepo repo;
 Future<String> _getDoctorAppointements()async{
    final user =await DoctorCache().getUser();
    return user?.id??"";
  }
 
  getDoctorAppointements()async{
    emit(const DoctorAppointementsState.loading());
    final id=await _getDoctorAppointements();

  final result=await repo.getDoctorAppointements(id);
  result.when(
    success: (data){
      emit(DoctorAppointementsState.success(data));
    },
    failure: (error){
      emit(DoctorAppointementsState.error(error.apiErrorModel.message??"حدث خطأ ما"));
    }
  );
  }
}
