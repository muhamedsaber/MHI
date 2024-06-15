class BookingRequestBody {
  final String day;
  final String time;
  final String patientId;
  final String doctorId;

  BookingRequestBody(
      {required this.day,
      required this.time,
      required this.patientId,
      required this.doctorId});
  Map<String, dynamic> toJson() {
    return {
      "day": day,
      "time": time,
      "patientID": patientId,
      "doctorID": doctorId,
    };
  }
}
