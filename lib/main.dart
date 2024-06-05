import 'package:flutter/material.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/mhi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(const MhiApp());
}
