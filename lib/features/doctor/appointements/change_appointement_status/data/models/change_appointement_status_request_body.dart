class ChangeAppointementsStatusRequestBody {
  final String bookingId;
  final String status;

  ChangeAppointementsStatusRequestBody({required this.bookingId, required this.status});
  Map<String, dynamic> toJson() {
    return {
      "bookingID": bookingId,
      "status": status,
    };
  }
}
