class RequestNewSurgeryRequestBody {
  String doctor;
  String patient;
  String specialize;
  String description;
  String hospitalId;

  RequestNewSurgeryRequestBody({
    required this.doctor,
    required this.patient,
    required this.specialize,
    required this.description,
    required this.hospitalId
  });

  Map<String, dynamic> toJson() {
    return {
      'doctor': doctor,
      'patient': patient,
      'specialize': specialize,
      'description': description,
        'hospitalID':hospitalId

    };
  }
}
