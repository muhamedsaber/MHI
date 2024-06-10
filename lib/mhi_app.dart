import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mhi/config/Theme/app_theme.dart';
import 'package:mhi/config/router/app_router.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/constants/app_constants.dart';

class MhiApp extends StatelessWidget {
  const MhiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return ValueListenableBuilder(
          valueListenable: Hive.box(AppConstants.themeBox).listenable(),
          builder: (context, box, child) {
            var darkMode =
                box.get(AppConstants.isDarkMode, defaultValue: false);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter.onGenerateRoute,
              theme: darkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
              initialRoute: Routes.splashView,
            );
          },
        );
      },
    );
  }
}
