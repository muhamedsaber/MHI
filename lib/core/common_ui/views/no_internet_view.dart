import 'package:flutter/material.dart';
import 'package:mhi/core/helper/app_strings.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
           Icon(
            Icons.error,
            size: 100,
            color: Colors.red,
          ),
           Text(
            AppStrings.noInternetConnection,
            
          ),
        ],
      ),
    );
  }
}
