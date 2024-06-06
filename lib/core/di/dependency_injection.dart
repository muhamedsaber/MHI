import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mhi/core/networking/api/common/common_api_service.dart';
import 'package:mhi/core/networking/dio_factory.dart';
import 'package:mhi/features/auth/login/data/repos/login_repository.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/signup/data/repos/signup_repo.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_cubit.dart';

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
}
