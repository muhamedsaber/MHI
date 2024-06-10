import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/extensions.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayedNavigation();
    super.initState();
  }

  //navigation for the onBoarding view
  void delayedNavigation() async {
    log("splash view started");
    bool isUserVisitedOnBoarding = await checkOnBoardingVisitStatus();
    bool isPatientLoggedIn = await checkPatientLoginStatus();
    bool isDoctorLoggedIn = await checkDoctorLoginStatus();
    log("isDoctorLoggedIn: $isDoctorLoggedIn");
    log("isPatientLoggedIn: $isPatientLoggedIn");
    log("isUserVisitedOnBoarding: $isUserVisitedOnBoarding");
    await Future.delayed(const Duration(seconds: 3), () {
      if (isUserVisitedOnBoarding) {
        if (isPatientLoggedIn) {
          context.navigateTo(Routes.userBottomNavBar);
        } else {
          context.navigateTo(Routes.loginView);
        }
      } else {
        context.navigateTo(Routes.onBoarding);
      }
    });
  }

  checkOnBoardingVisitStatus() async {
    return await CacheHelper.getBool(
        key: DatabaseConstants.isUserVisitedOnBoarding);
  }

  checkPatientLoginStatus() async {
    return await CacheHelper.getBool(key: DatabaseConstants.isPatientLoggedIn);
  }

  checkDoctorLoginStatus() async {
    return await CacheHelper.getBool(key: DatabaseConstants.isDoctorLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 230,
          width: 230,
          child: Image.asset(Assets.assetsImagesColoredLogo),
        ),
      ),
    );
  }
}
