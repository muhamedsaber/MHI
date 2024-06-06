import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignuptStates>(
      listener: (context, state) {
        if (state is SignupLoading) {
          Alerts().customLoadingindicator(context);
        } else if (state is SignupSuccess) {
          String message = "";
          if (state.message == "Patient signup successful") {
            message = "تم تسجيل الحساب بنجاح";
          } else {
            message = state.message;
          }
          context.navigateBack();
          Alerts()
              .showCustomToast(message: message, color: AppColors.lightGreen);
          context.navigateBack();
          Alerts().showCustomToast(
              message: "يمكنك تسجيل الدخول الأن", color: AppColors.lightGreen);
        } else if (state is SignupError) {
          context.navigateBack();
          Alerts().showCustomToast(
              message: state.message, color: AppColors.lightRed);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
