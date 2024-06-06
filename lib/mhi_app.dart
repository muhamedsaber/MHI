import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/Theme/app_theme.dart';
import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/config/router/app_router.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/constants/database_constants.dart';

class MhiApp extends StatelessWidget {
  const MhiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return FutureBuilder(
          future: CacheHelper.getBool(
              key: DatabaseConstants.isUserVisitedOnBoarding),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRouter.onGenerateRoute,
                theme: AppTheme.lightTheme,
                initialRoute: snapshot.data == true
                    ? Routes.loginView
                    : Routes.onBoarding,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
