class ChangeAppointementStatusResponseBody{
  final String? message;

  ChangeAppointementStatusResponseBody({required this.message});

  factory ChangeAppointementStatusResponseBody.fromJson(Map<String, dynamic> json){
    return ChangeAppointementStatusResponseBody(
      message: json['message']
    );
  }
}