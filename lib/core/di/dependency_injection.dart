import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mhi/core/networking/api/common/common_api_service.dart';
import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/dio_factory.dart';
import 'package:mhi/features/auth/login/data/repos/login_repository.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/signup/data/repos/signup_repo.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:mhi/features/common/records/data/repos/patient_record_repo.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_cubit.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/repo/firebase_hospitals_repo.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/logic/cubit/firebase_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/data/repos/all_hospitals_repo.dart';
import 'package:mhi/features/patient/hospitals/data/repos/doctors/get_doctors_by_hospital_id.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/cubit/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/doctors/cubit/get_doctors_by_hospital_cubit.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/Logic/saved_doctors/cubit/saved_doctors_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/repos/get_all_doctors_repo.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/repos/get_doctor_by_specialize.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/specializes/repos/specializes_repo.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/cubit/specializes_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/doctors/book_doctors_cubit.dart';

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
  getIt.registerSingleton<GetAllDoctorsRepo>(
      GetAllDoctorsRepo(apiService: getIt()));
  getIt.registerSingleton<GetDoctorBySpecialize>(
      GetDoctorBySpecialize(service: getIt()));
  getIt.registerSingleton<BookDoctorsCubit>(BookDoctorsCubit(
      getAllDoctorsRepo: getIt(), getDoctorBySpecialize: getIt()));

  //data base cubits
  getIt.registerSingleton<SavedDoctorsCubit>(SavedDoctorsCubit());

  /// patient Record cubit
  getIt.registerSingleton<PatientRecordRepo>(
      PatientRecordRepo(service: getIt()));
  getIt
      .registerSingleton<PatientRecordCubit>(PatientRecordCubit(repo: getIt()));

  // This For Firebase hospitals

  getIt.registerSingleton<FirebaseHospitalRepo>(FirebaseHospitalRepo());
  getIt.registerSingleton<FirebaseHospitalsCubit>(
      FirebaseHospitalsCubit(firebaseHospitalRepo: getIt()));

  /// AllHospitals
  getIt.registerSingleton<AllHospitalsRepo>(AllHospitalsRepo(getIt()));
  getIt.registerSingleton<AllHospitalsCubit>(
      AllHospitalsCubit(allHospitalsRepo: getIt()));

  // doctors by hospital id
  getIt.registerSingleton<GetDoctorsByHospitalIdRepo>(
      GetDoctorsByHospitalIdRepo(apiService: getIt()));
  getIt.registerSingleton<GetDoctorsByHospitalCubit>(
      GetDoctorsByHospitalCubit(getDoctorsByHospitalId: getIt()));
}
