class GetDoctorDaysRequestBody{
  final String doctorId;

  GetDoctorDaysRequestBody({required this.doctorId});
  Map<String,dynamic>toJson(){
    return {
      "doctorID":doctorId
    };
  }
}