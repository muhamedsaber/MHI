import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/common_ui/widgets/request_status_sheet.dart';
import 'package:mhi/features/patient/profile/get_patient_profile/Logic/cubit/get_patient_information.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/Logic/update_patient_profile_cubit.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/Logic/update_patient_profile_state.dart';

class UpadeProfileBlocListener extends StatelessWidget {
  const UpadeProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePatientProfileCubit, UpdatePatientProfileState>(
      listener: (context, state) {
        state.when(
            initial: () {},
            loading: () => Alerts().customLoadingindicator(context),
            success: (message) {
              
              context.navigateBack();
               updateTheProfileCache();
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return RequestStatusSheet(
                      message: message,
                      errorAnimationAsset: Assets.doneAnimation);
                },
              );
             
            },
            error: (error) {
              context.navigateBack();
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return RequestStatusSheet(
                      message: error,
                      errorAnimationAsset: Assets.failedAnimation);
                },
              );
            });
      },
      child: const SizedBox.shrink(),
    );
  }

  updateTheProfileCache() {
    getIt<GetPatientInformationCubit>().getUpdatedPatientInformationFromApi();
  }
}
