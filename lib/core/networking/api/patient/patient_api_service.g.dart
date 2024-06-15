// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PatientApiService implements PatientApiService {
  _PatientApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://mhiproject.onrender.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<SpecializeModel>> getSpecializes() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<SpecializeModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'hospitalAdmin/getSpecializes',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => SpecializeModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<BookDoctorsModel> getAllDoctors() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BookDoctorsModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'patient/getDoctors',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BookDoctorsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookDoctorsModel> getDoctorsBySpecialize(
      {required Map<String, dynamic> body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BookDoctorsModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'patient/search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BookDoctorsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AllBookingHospitalsModel> getHospitals() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AllBookingHospitalsModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'patient/getHospitals',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AllBookingHospitalsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookDoctorsModel> getDoctorByHospitalId(
      {required Map<String, dynamic> body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BookDoctorsModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'patient/searchHospital',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BookDoctorsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MhiMedicineModel> getMedicines() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MhiMedicineModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'patient/getMedicines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MhiMedicineModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookingResponseBody> bookNewAppointment(
      {required BookingRequestBody boolingRequestBody}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(boolingRequestBody.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookingResponseBody>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'patient/book',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BookingResponseBody.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<PatientAppointmentModel>> getWaitingBooks(
      {required String id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PatientAppointmentModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'patient/getWaitingBooks/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            PatientAppointmentModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<PatientAppointmentModel>> getDoneBooks(
      {required String id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PatientAppointmentModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'patient/getDone/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            PatientAppointmentModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
