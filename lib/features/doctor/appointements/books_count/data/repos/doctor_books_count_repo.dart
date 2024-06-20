import 'package:mhi/core/networking/api/doctor/doctor_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/doctor/appointements/books_count/data/models/doctor_books_count_response_body.dart';

class DoctorBooksCountRepo{
  final DoctorApiService apiService;

  DoctorBooksCountRepo({required this.apiService});
  Future<ApiResult<DoctorBooksCountResponseBody>>getBooksCount({
    required String id
  })async{
    try {
      DoctorBooksCountResponseBody response=await apiService.getDoctorBooksCount(id: id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
    
  }
}