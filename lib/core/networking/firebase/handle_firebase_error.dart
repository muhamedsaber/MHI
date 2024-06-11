import 'package:firebase_core/firebase_core.dart';

handleFirebaseError(FirebaseException e) {
  switch (e.code) {
    case 'no-internet':
      return FireBaseErrorModel(
          message: 'لا يوجد اتصال بالإنترنت',
          code: 'no-internet',
          errorType: FireBaseErrors.noInternet);
    case 'no-data':
      return FireBaseErrorModel(
          message: 'لا يوجد بيانات',
          code: 'no-data',
          errorType: FireBaseErrors.noData);
    case 'no-connection':
      return FireBaseErrorModel(
          message: 'لا يوجد اتصال بالخادم',
          code: 'no-connection',
          errorType: FireBaseErrors.noConnection);

    default:
      return FireBaseErrorModel(
          message: "حدث خطأ غير معروف",
          code: 'unknown-error',
          errorType: FireBaseErrors.unknownError);
  }
}

enum FireBaseErrors { noInternet, noData, noConnection, unknownError, noError }

class FireBaseErrorModel {
  final String? message;
  final String? code;
  final FireBaseErrors errorType;
  FireBaseErrorModel({this.message, this.code, required this.errorType});
}

class FireBaseErrorHandler implements Exception {
  late FireBaseErrorModel fireBaseErrorModel;
  FireBaseErrorHandler.handle(dynamic error) {
    if (error is FirebaseException) {
      fireBaseErrorModel = handleFirebaseError(error);
    } else {
      FireBaseErrorModel(
        message: "حدث خطأ غير معروف",
        code: 'unknown-error',
        errorType: FireBaseErrors.unknownError,
      );
    }
  }
}
