class DoctorBooksCountResponseBody {
  final String? waiting;
  final String? done;
  final String? cancelled;

  DoctorBooksCountResponseBody(
      {required this.waiting, required this.done, required this.cancelled});
  factory DoctorBooksCountResponseBody.fromJson(Map<String, dynamic> json) {
    return DoctorBooksCountResponseBody(
        waiting: json["waitingCounter"],
        done: json["doneCounter"],
        cancelled: json["cancelledCounter"]);
  }
}
