class DoctorBooksCountResponseBody {
  final int? waiting;
  final int? done;
  final int? cancelled;

  DoctorBooksCountResponseBody(
      {required this.waiting, required this.done, required this.cancelled});
  factory DoctorBooksCountResponseBody.fromJson(Map<String, dynamic> json) {
    return DoctorBooksCountResponseBody(
        waiting: json["waitingCounter"],
        done: json["doneCounter"],
        cancelled: json["cancelledCounter"]);
  }
}
