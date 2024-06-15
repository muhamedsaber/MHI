// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingResponseBody _$BookingResponseBodyFromJson(Map<String, dynamic> json) =>
    BookingResponseBody(
      theBook: json['theBook'] == null
          ? null
          : BookResponseData.fromJson(json['theBook'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingResponseBodyToJson(
        BookingResponseBody instance) =>
    <String, dynamic>{
      'theBook': instance.theBook,
    };

BookResponseData _$BookResponseDataFromJson(Map<String, dynamic> json) =>
    BookResponseData(
      day: json['day'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
      doctorID: json['doctorID'] as String?,
      patientID: json['patientID'] as String?,
      id: json['id'] as String?,
      v: (json['v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookResponseDataToJson(BookResponseData instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
      'status': instance.status,
      'doctorID': instance.doctorID,
      'patientID': instance.patientID,
      'id': instance.id,
      'v': instance.v,
    };
