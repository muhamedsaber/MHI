import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

sealed class SavedDoctorsState{

}
class SavedDoctorsInitial extends SavedDoctorsState {
  SavedDoctorsInitial();
}
class SavedDoctorsLoading extends SavedDoctorsState {
  SavedDoctorsLoading();
}
class SavedDoctorsSuccess extends SavedDoctorsState {
  final List<DoctorBookData> doctors;
  SavedDoctorsSuccess({required this.doctors});
}
class SavedDoctorsError extends SavedDoctorsState {
  final String message;
  SavedDoctorsError({required this.message});
}
class DoctorSavedSuccessFully extends SavedDoctorsState {
  
}
class DoctorRemovedSuccessFully extends SavedDoctorsState {
  
}