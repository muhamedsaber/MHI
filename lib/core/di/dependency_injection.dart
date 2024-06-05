import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mhi/core/networking/api/common_api_service.dart';
import 'package:mhi/core/networking/dio_factory.dart';
import 'package:mhi/features/auth/login/data/repos/login_repository.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;
setupDependencyInjection() {
  Dio dio = DioFactory.getDio();

  //Common Apis Service

  getIt.registerSingleton<CommonApiService>(CommonApiService(getIt()));
  getIt
      .registerSingleton<LoginRepository>(LoginRepository(apiService: getIt()));
  getIt.registerSingleton<LoginCubit>(LoginCubit(repository: getIt()));

  
}
