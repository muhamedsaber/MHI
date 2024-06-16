class UpdateProfileResponseBody{
  final String message;

  UpdateProfileResponseBody({required this.message});
  factory UpdateProfileResponseBody.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseBody(
      message: json['Message'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "Message": message,
    };
  }

}