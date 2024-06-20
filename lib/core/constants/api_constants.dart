class ApiConstants {
  static const String baseUrl = "https://mhiproject.onrender.com/";
  static const String authEndpoint = "auth/login";
  static const String signupPatientEndpoint = "auth/signupPatient";
  static const String getAllHospitalsEndPoint = "patient/getHospitals";
  static const String getAllPatientEndpoint = "auth/getPatients";
  static const String getAllDoctorsEndpoint = "patient/getDoctors";
  static const String searchEndpoint = "patient/search";
  static const String bookAppointementEndpoint = "patient/book";
  static const String searchMedicineEndpoint = "patient/searchMedicine";
  static const String searchHospital = "patient/searchHospital";
  static const String getAllMedicinesEndpoint = "patient/getMedicines";
  static const String getDoctorDaysEndpoint = "patient/getDays";
  static const String getDoctorTimesEndpoint = "patient/getTime";
  static const String getPatientWaitingBooks = "patient/getWaitingBooks";
  static const String getPatientDoneBooks = "patient/getDone";
  static const String getPatientRecords = "patient/getRecords";
  static const String updatePatientProfileEndpoint = "patient/updateProfile";
  static const String getPatientProfileEndpoint = "patient/getProfile";
  static const String createPatientRecordEndpoint = "doctor/createRecord";
  static const String showDoctorBooksEndpoint = "doctor/showBooking";
  static const String changeDoctorBookingStatusEndpoint =
      "doctor/changeBookingStatus";
  static const String countDoctorBooksEndpoint = "doctor/countBooks";
  static const String requestSurgeryEndpoint = "doctor/requestSurgery";
  static const String getDoctorSurgeryEndpoint = "doctor/getSurgeries";
  static const String cancelDoctorDayWorkEndpoint = "doctor/cancelDay";
  static const String getSpecializesEndpoint = "hospitalAdmin/getSpecializes";
}

class OpenFdaApiConstants {
  static const String baseUrl = "https://api.fda.gov/drug/";

  static const String lableJson = "label.json";
}
