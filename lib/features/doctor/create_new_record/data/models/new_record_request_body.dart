class NewRecordRequestBody {
  final String patientID;
  final String doctorID;
  final List<Diagnose> diagnose;

  NewRecordRequestBody({
    required this.patientID,
    required this.doctorID,
    required this.diagnose,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> diagnoseList = [];
    for (var element in diagnose) {
      diagnoseList.add(element.toJson());
    }

    return {
      'patientID': patientID,
      'doctorID': doctorID,
      'diagnose': diagnoseList,
    };
  }
}

class Diagnose {
  final String medicine;
  final String description;

  Diagnose({
    required this.medicine,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'medicine': medicine,
      'description': description,
    };
  }
}
