

import 'package:json_annotation/json_annotation.dart';
part 'booking_response_body.g.dart';
@JsonSerializable()
class BookingResponseBody{
  final BookResponseData? theBook;

  BookingResponseBody({ this.theBook});
  
  factory BookingResponseBody.fromJson(Map<String, dynamic> json) => _$BookingResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$BookingResponseBodyToJson(this);

}

@JsonSerializable()
class BookResponseData{
  final String? day;
  final String? time;
  final String? status;
  final String? doctorID;
  final String? patientID;
  final String? id;
  final int? v;

  BookResponseData({
     this.day,
     this.time,
     this.status,
     this.doctorID,
     this.patientID,
     this.id,
     this.v,
  });

  factory BookResponseData.fromJson(Map<String, dynamic> json) => _$BookResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookResponseDataToJson(this);
}