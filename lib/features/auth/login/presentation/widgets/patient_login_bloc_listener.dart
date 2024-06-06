import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_state.dart';

class PatientLoginBlocListener extends StatelessWidget {
  const PatientLoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(listener: (context, state) {
      state.when(
        loading: () =>Alerts().customLoadingindicator(context),
        initial: () => {},
        successPatient: () {
          context.navigateBack();
          Alerts(). showCustomToast(message: "تم تسجيل الدخول بنجاح", color: AppColors.lightGreen);
          
        },
        successDoctor: () {
          context.navigateBack();
         Alerts(). showCustomToast(message:"لا يمكنك تسجيل الدخول", color: AppColors.lightRed);
        },
        error: (message){
          context.navigateBack();
         Alerts(). showCustomToast(message: message, color: AppColors.lightRed);
        },
     
      );
    },
    child:const SizedBox.shrink(),
    );
    
  }
}