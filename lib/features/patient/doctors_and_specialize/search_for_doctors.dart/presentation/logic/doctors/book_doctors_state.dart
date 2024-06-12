part of 'book_doctors_cubit.dart';

sealed class BookDoctorsState{

}
class BookDoctorsInitial extends BookDoctorsState {
  BookDoctorsInitial();
}
class BookDoctorsLoading extends BookDoctorsState {
  BookDoctorsLoading();
}
class BookDoctorsLoaded extends BookDoctorsState {
  final BookDoctorsModel doctors;
  BookDoctorsLoaded({required this.doctors});
}
class BookDoctorsError extends BookDoctorsState {
  final String message;
  BookDoctorsError({required this.message});
}