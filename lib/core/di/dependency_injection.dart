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
import 'package:mhi/features/patient/appointements/data/repos/get_patient_done_books_repo.dart';
import 'package:mhi/features/patient/appointements/data/repos/get_patient_waiting_books.dart';
import 'package:mhi/features/patient/appointements/presentation/logic/done_books/get_patinet_done_books_cubit.dart';
import 'package:mhi/features/patient/appointements/presentation/logic/waiting_books/get_patient_waititng_books_dart_cubit.dart';
import 'package:mhi/features/patient/booking/data/repo/book_new_appointement_repo.dart';
import 'package:mhi/features/patient/booking/data/repo/get_doctor_days_repo.dart';
import 'package:mhi/features/patient/booking/data/repo/get_doctor_times_repo.dart';
import 'package:mhi/features/patient/booking/presentation/logic/booking_process/cubit/booking_process_cubit.dart';
import 'package:mhi/features/patient/booking/presentation/logic/dates/cubit/get_doctor_days_cubit.dart';
import 'package:mhi/features/patient/booking/presentation/logic/times/cubit/get_doctor_times_cubit.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/repo/firebase_hospitals_repo.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/logic/cubit/firebase_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/data/repos/all_hospitals_repo.dart';
import 'package:mhi/features/patient/hospitals/data/repos/doctors/get_doctors_by_hospital_id.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/hospitals/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/doctors/cubit/get_doctors_by_hospital_cubit.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/data/mhi/repos/mhi_medicine_repo.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/presentation/Logic/mhi_medicines/cubit/mhi_medicines_cubit.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/Logic/saved_doctors/cubit/saved_doctors_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/repos/get_all_doctors_repo.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/repos/get_doctor_by_specialize.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/specializes/repos/specializes_repo.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/specialize/specializes_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/doctors/book_doctors_cubit.dart';
import 'package:mhi/features/patient/profile/update_profile/data/repos/update_profile_repo.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/Logic/update_patient_profile_cubit.dart';

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

  /// medicines
  getIt
      .registerSingleton<MhiMedicineRepo>(MhiMedicineRepo(apiService: getIt()));
  getIt.registerSingleton<MhiMedicinesCubit>(MhiMedicinesCubit(repo: getIt()));

  /// doctor Days For Booking
  getIt.registerSingleton<GetDoctorDaysRepo>(
      GetDoctorDaysRepo(apiService: getIt()));
  getIt.registerSingleton<GetDoctorDaysCubit>(
      GetDoctorDaysCubit(getDoctorDaysRepo: getIt()));

  /// get doctor times
  getIt.registerSingleton<GetDoctorTiemsRepo>(
      GetDoctorTiemsRepo(apiService: getIt()));
  getIt.registerSingleton<GetDoctorTimesCubit>(
      GetDoctorTimesCubit(repo: getIt()));

  /// Booking New Appointment
  getIt.registerSingleton<BookNewAppointementRepo>(
      BookNewAppointementRepo(apiService: getIt()));
  getIt.registerSingleton<BookingProcessCubit>(
      BookingProcessCubit(repo: getIt()));

  /// Patient [Appointements] Waiting Books
  getIt.registerSingleton<GetPatientWaitingBooksRepo>(
      GetPatientWaitingBooksRepo(apiService: getIt()));
  getIt.registerSingleton<GetPatientWaititngBooksDartCubit>(
      GetPatientWaititngBooksDartCubit(repo: getIt()));

  /// Patient [Appointements] Done Books
  getIt.registerSingleton<GetPatientDoneBooksRepo>(
      GetPatientDoneBooksRepo(apiService: getIt()));
  getIt.registerSingleton<GetPatinetDoneBooksCubit>(
      GetPatinetDoneBooksCubit(repo: getIt()));


      /// update patientProfile 
  getIt.registerSingleton<UpdateProfileRepo>(UpdateProfileRepo(apiService:getIt()));
  getIt.registerSingleton<UpdatePatientProfileCubit>(UpdatePatientProfileCubit(repo:getIt()));
}
