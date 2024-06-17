import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
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
    debugPrint(
        "UserCache : getUser with key : ${DatabaseConstants.patientCacheKey} ${userStr}");
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

  /// This method have only one job, which is to update the user profile in the cache
  /// but Its Only Updating the changable data
  Future<void> updateUserProfile({required PatientModel user}) async {
    PatientModel? model = await getUser();

    await CacheHelper.setData(
        key: DatabaseConstants.patientCacheKey,
        value: jsonEncode(PatientModel(
                address: user.address,
                mobileNumber: user.mobileNumber,
                weight: user.weight,
                height: user.height,
                bloodType: user.bloodType,
                birthday: model?.birthday,
                id: model?.id,
                name: model?.name,
                password: model?.password,
                role: model?.role,
                token: model?.token,
                userCode: model?.userCode,
                username: model?.username)
            .toJson()));
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
