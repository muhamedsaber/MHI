class SignupResponse {
  final String? message;

  SignupResponse({this.message});

  factory SignupResponse.fromJson(Map<String, dynamic>? json) {
    return SignupResponse(
        message: json != null && json['message'] != null
            ? json["message"]
            : {"message": "حدث خطأ ما"});
  }
}
