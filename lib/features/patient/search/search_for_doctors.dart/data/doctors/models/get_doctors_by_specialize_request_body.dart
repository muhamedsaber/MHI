class GetDoctorsBySpecializeRequestBody {
  String specialize;

  GetDoctorsBySpecializeRequestBody({
    required this.specialize,
  });

  Map<String, dynamic> toJson() {
    return {
      "specialize": specialize,
    };
  }
}
