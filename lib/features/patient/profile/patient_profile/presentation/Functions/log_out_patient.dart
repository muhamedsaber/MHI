 import 'package:flutter/material.dart';
import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/config/database/local/patient/doctor_database.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/core/helper/alerts.dart';

class PatientLogout{
 static  logoutPatient() async {
    Alerts().showCustomToast(color: Colors.green, message: "جاري تسجيل الخروج");
    await PatientCache().removeUser();
    await CacheHelper.setData(
        key: DatabaseConstants.isPatientLoggedIn, value: false);
    await DoctorDatabase().deleteAll();
  }
}