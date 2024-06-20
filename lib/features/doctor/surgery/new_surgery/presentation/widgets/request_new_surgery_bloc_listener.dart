import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/cubit/request_new_surgery_cubit.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/cubit/request_new_surgery_state.dart';

class RequestNewSurgeryBlocListener extends StatelessWidget {
  const RequestNewSurgeryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestNewSurgeryCubit, RequestNewSurgeryState>(
        listener: (context, state) {
          state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => Alerts().customLoadingindicator(context),
              loaded: (message) {
                context.navigateBack();
                Alerts().requestStatusResultSheet(
                    context: context,
                    message:"تم ارسال طلب العملية بنجاح",
                    animationAsset: Assets.doneAnimation);
              },
              error: (error) {
                context.navigateBack();
                Alerts().requestStatusResultSheet(
                    context: context,
                    message: error,
                    animationAsset: Assets.failedAnimation);
              });
        },
        child: const SizedBox.shrink());
  }
}
