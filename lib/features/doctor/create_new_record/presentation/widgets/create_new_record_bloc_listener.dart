import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/cubit/create_new_record_cubit.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/cubit/create_new_record_state.dart';

class CreateNewRecordBlocListener extends StatelessWidget {
  const CreateNewRecordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNewRecordCubit, CreateNewRecordState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          success: (message) {
            context.navigateBack();
            Alerts().requestStatusResultSheet(
                context: context,
                message: message,
                animationAsset: Assets.doneAnimation);
          },
          error: (message) {
            context.navigateBack();
            Alerts().requestStatusResultSheet(
                context: context,
                message: "حدث خطأ غير متوقع",
                animationAsset: Assets.doneAnimation);
          },
          loading: () => Alerts().customLoadingindicator(context),
        );
      },
      child: Container(),
    );
  }
}
