import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mhi/core/helper/app_colors.dart';

class Alerts {
  void showCustomToast({
    required String message,
    required Color color,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

// loading indicator
  customLoadingindicator(BuildContext context) {
    return showAdaptiveDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightGreen),
          ),
        );
      },
    );
  }
}
