import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultErrorRoute extends StatelessWidget {
  const DefaultErrorRoute({super.key, required this.routeName});
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 100.w,
            color: Colors.red,
          ),
          Text(
            'No Screens Found for $routeName',
            style: TextStyle(fontSize: 20.sp, color: Colors.red),
          ),
        ],
      ),
    );
  }
}