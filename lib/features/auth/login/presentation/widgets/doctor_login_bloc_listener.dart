import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_state.dart';

class DoctorLoginBlocListener extends StatelessWidget {
  const DoctorLoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.when(
          loading: () => Alerts().customLoadingindicator(context),
          initial: () => {},
          successPatient: () {
            context.navigateBack();
            // Alerts().showCustomToast(
            //     message: "لا يمكنك تسجيل الدخول", color: AppColors.lightRed);
          },
          successDoctor: () async {
            context.navigateBack();
            Alerts().showCustomToast(
                message: "تم تسجيل الدخول بنجاح", color: AppColors.lightGreen);
            context.navigateTo(Routes.doctorBottomNavBar);
            await saveDoctorLogginStatus();
          },
          error: (message) {
            context.navigateBack();
            Alerts()
                .showCustomToast(message: message, color: AppColors.lightRed);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  saveDoctorLogginStatus() async {
    await CacheHelper.setData(
        key: DatabaseConstants.isDoctorLoggedIn, value: true);
  }
}
