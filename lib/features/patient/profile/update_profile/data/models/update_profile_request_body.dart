class UpdateProfileRequestBody{
  final String mobileNumber;
  final String bloodType;
  final String patientId;
  final String weight;
  final String height;
  final String address;

  UpdateProfileRequestBody({required this.mobileNumber, required this.bloodType, required this.patientId, required this.weight, required this.height, required this.address});
  Map<String, dynamic> toJson() {
    return {
      "mobileNumber": mobileNumber,
      "bloodType": bloodType,
      "patientID": patientId,
      "weight": weight,
      "height": height,
      "address": address,
    };
  }
}
