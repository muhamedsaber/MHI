import 'dart:convert';

import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';

abstract class UserCache<T> {
  Future<T?> getUser();
  Future<void> removeUser();
  Future<void> saveAndUpdateUser({required T? user});
}

class PatientCache implements UserCache<PatientModel> {
  @override
  Future<PatientModel?> getUser() async {
    String? userStr =
        await CachHelper.getString(key: DatabaseConstants.patientCacheKey);
    if (userStr != null) {
      return PatientModel.fromJson(jsonDecode(userStr));
    } else {
      return null;
    }
  }

  @override
  Future<void> saveAndUpdateUser({required PatientModel? user}) async {
    if (user == null) {
      throw ArgumentError.notNull("The Patient Model is Null");
    }
    String userStr = jsonEncode(user.toJson());
    String? data =
        await CachHelper.getString(key: DatabaseConstants.patientCacheKey);
    if (data != null) {
      await CachHelper.put(
          key: DatabaseConstants.patientCacheKey, value: userStr);
    } else {
      await CachHelper.saveData(
          key: DatabaseConstants.patientCacheKey, value: userStr);
    }
  }

  @override
  Future<void> removeUser() async {
    String? data =
        await CachHelper.getString(key: DatabaseConstants.patientCacheKey);
    if (data == null) {
      throw ArgumentError("The patient does not exist");
    }
    await CachHelper.remove(key: DatabaseConstants.patientCacheKey);
  }
}

class DoctorCache implements UserCache<DoctorModel> {
  @override
  Future<DoctorModel?> getUser() async {
    String? userStr =
        await CachHelper.getString(key: DatabaseConstants.doctorCacheKey);
    if (userStr != null) {
      return DoctorModel.fromJson(jsonDecode(userStr));
    } else {
      return null;
    }
  }

  @override
  Future<void> saveAndUpdateUser({required DoctorModel? user}) async {
    if (user == null) {
      throw ArgumentError.notNull("The doctor Model is Null");
    }
    String userStr = jsonEncode(user.toJson());
    String? data =
        await CachHelper.getString(key: DatabaseConstants.doctorCacheKey);
    if (data != null) {
      await CachHelper.put(
          key: DatabaseConstants.doctorCacheKey, value: userStr);
    } else {
      await CachHelper.saveData(
          key: DatabaseConstants.doctorCacheKey, value: userStr);
    }
  }

  @override
  Future<void> removeUser() async {
    String? data =
        await CachHelper.getString(key: DatabaseConstants.doctorCacheKey);
    if (data == null) {
      throw ArgumentError("The doctor does not exist");
    }
    await CachHelper.remove(key: DatabaseConstants.doctorCacheKey);
  }
}
