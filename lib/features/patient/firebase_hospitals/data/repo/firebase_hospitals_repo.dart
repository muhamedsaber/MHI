import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mhi/core/networking/firebase/firebase_result.dart';
import 'package:mhi/core/networking/firebase/handle_firebase_error.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/models/firebase_hospital_model.dart';

const String hospitalsCollection = "hospitals";

class FirebaseHospitalRepo {
  final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;

  Future<FirebaseResult<List<FireBaseHospitalsModel>>> getAllHospitals() async {
    try {
      QuerySnapshot<Map<String, dynamic>> hospitals =
          await firebaseFirestore.collection(hospitalsCollection).get();
      List<QueryDocumentSnapshot> hospitalsDocs = hospitals.docs;
      List<FireBaseHospitalsModel> hospitalsList = [];
      for (var element in hospitalsDocs) {
        FireBaseHospitalsModel model = FireBaseHospitalsModel.fromJson(
            element.data() as Map<String, dynamic>);
        hospitalsList.add(model);
      }
      return FirebaseResult.success(hospitalsList);
    } catch (e) {
      return FirebaseResult.failure(FireBaseErrorHandler.handle(e));
    }
  }
}
