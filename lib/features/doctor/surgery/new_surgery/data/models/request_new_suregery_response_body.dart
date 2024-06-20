class RequestNewSurgeryResponseBody {
  final String message;

  RequestNewSurgeryResponseBody({
    required this.message,
  });

  factory RequestNewSurgeryResponseBody.fromJson(Map<String, dynamic> json) {
    return RequestNewSurgeryResponseBody(
      message: json['message'],
    );
  }
}
