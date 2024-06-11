import 'dart:convert';
import 'dart:developer';

import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';

sealed class UserCache<T> {
  Future<T?> getUser();
  Future<void> removeUser();
  Future<void> saveUser({required T user});
}

class PatientCache implements UserCache<PatientModel> {
  @override
  Future<PatientModel?> getUser() async {
    String? userStr =
        await CacheHelper.getString(key: DatabaseConstants.patientCacheKey);
    log("userStr: $userStr");
    if (userStr != null) {
      return PatientModel.fromJson(jsonDecode(userStr));
    } else {
      return null;
    }
  }

  @override
  Future<void> saveUser({required PatientModel user}) async {
    await CacheHelper.setData(
        key: DatabaseConstants.patientCacheKey,
        value: jsonEncode(user.toJson()));
  }

  @override
  Future<void> removeUser() async {
    String? data =
        await CacheHelper.getString(key: DatabaseConstants.patientCacheKey);
    if (data == null) {
      throw ArgumentError("The patient does not exist");
    }
    await CacheHelper.removeData(key: DatabaseConstants.patientCacheKey);
  }
}

class DoctorCache implements UserCache<DoctorModel> {
  @override
  Future<DoctorModel?> getUser() async {
    String? userStr =
        await CacheHelper.getString(key: DatabaseConstants.doctorCacheKey);
    if (userStr != null) {
      return DoctorModel.fromJson(jsonDecode(userStr));
    } else {
      return null;
    }
  }

  @override
  Future<void> saveUser({required DoctorModel user}) async {
    await CacheHelper.setData(
        key: DatabaseConstants.doctorCacheKey,
        value: jsonEncode(user.toJson()));
  }

  @override
  Future<void> removeUser() async {
    String? data =
        await CacheHelper.getString(key: DatabaseConstants.doctorCacheKey);
    if (data == null) {
      throw ArgumentError("The doctor does not exist");
    }
    await CacheHelper.removeData(key: DatabaseConstants.doctorCacheKey);
  }
}
