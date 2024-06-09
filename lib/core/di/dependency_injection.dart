import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mhi/core/networking/api/common/common_api_service.dart';
import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/dio_factory.dart';
import 'package:mhi/features/auth/login/data/repos/login_repository.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/signup/data/repos/signup_repo.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/repos/get_all_doctors_repo.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/specializes/repos/specializes_repo.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/logic/cubit/specializes_cubit.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/logic/doctors/book_doctors_cubit.dart';

final getIt = GetIt.instance;
setupDependencyInjection() async {
  Dio dio = DioFactory.getDio();

  //Common Apis Service

  getIt.registerSingleton<CommonApiService>(CommonApiService(dio));
  getIt
      .registerSingleton<LoginRepository>(LoginRepository(apiService: getIt()));
  getIt.registerSingleton<LoginCubit>(LoginCubit(repository: getIt()));

  // signup repo and signup cubit
  getIt.registerSingleton<SignupRepository>(
      SignupRepository(apiService: getIt()));
  getIt.registerSingleton<SignupCubit>(SignupCubit(repository: getIt()));

  //specializes dependencies
  getIt.registerSingleton<PatientApiService>(PatientApiService(dio));
  getIt.registerSingleton<SpecializesRepository>(
      SpecializesRepository(apiService: getIt()));
  getIt.registerSingleton<SpecializesCubit>(
      SpecializesCubit(specializesRepository: getIt()));



  // get all doctors dependencies
  getIt.registerSingleton<GetAllDoctorsRepo>(GetAllDoctorsRepo(apiService: getIt()));
  getIt.registerSingleton<BookDoctorsCubit>(BookDoctorsCubit(getAllDoctorsRepo: getIt()));
}
