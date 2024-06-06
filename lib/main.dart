import 'package:flutter/material.dart';
import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/mhi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  await CachHelper.initCache();

  runApp(const MhiApp());
}
