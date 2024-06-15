class GetDoctorTimesRequestBody {
  final String doctorId;
  final String day;

  GetDoctorTimesRequestBody({required this.doctorId, required this.day});
  Map<String, dynamic> toJson() {
    return {"doctorID": doctorId, "day": day};
  }
}
