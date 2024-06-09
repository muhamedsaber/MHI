import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/Theme/app_theme.dart';
import 'package:mhi/config/router/app_router.dart';
import 'package:mhi/config/router/routes.dart';

class MhiApp extends StatelessWidget {
  const MhiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: AppTheme.darkTheme,
          initialRoute: Routes.onBoarding,
        );
      },
    );
  }
}
