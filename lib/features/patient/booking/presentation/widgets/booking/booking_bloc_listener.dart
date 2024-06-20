import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/booking/presentation/logic/booking_process/cubit/booking_process_cubit.dart';
import 'package:mhi/features/patient/booking/presentation/logic/booking_process/cubit/booking_process_state.dart';
import 'package:mhi/core/common_ui/widgets/request_status_sheet.dart';

class BookingBlocListener extends StatelessWidget {
  const BookingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingProcessCubit, BookingProcessState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Alerts().customLoadingindicator(context),
          loaded: () {
            context.navigateBack();
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const RequestStatusSheet(
                  errorAnimationAsset: Assets.doneAnimation,
                  message: "تم حجز الموعد بنجاح",
                );
              },
            );
          },
          error: (errorMessage) {
            context.navigateBack();
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const RequestStatusSheet(
                  errorAnimationAsset: Assets.failedAnimation,
                  message: "لا يمكن حجز هذ الموعد",
                );
              },
            );
          },
        );
      },
    );
  }
}
