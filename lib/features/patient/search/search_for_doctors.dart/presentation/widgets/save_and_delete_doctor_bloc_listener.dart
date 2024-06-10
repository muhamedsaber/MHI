import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/features/patient/saved/presentation/Logic/cubit/saved_doctors_cubit.dart';
import 'package:mhi/features/patient/saved/presentation/Logic/cubit/saved_doctors_state.dart';

class SaveAndDeleteDoctorBlocListener extends StatelessWidget {
  const SaveAndDeleteDoctorBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SavedDoctorsCubit, SavedDoctorsState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is DoctorSavedSuccessFully) {
          Alerts().showCustomToast(
              message: "تم الإضافة الي المفضلة بنجاح",
              color: AppColors.lightGreen);
        } else if (state is DoctorRemovedSuccessFully) {
          Alerts().showCustomToast(
              message: "تمت الإزالة من المفضلة", color: AppColors.lightRed);
        }
      },
    );
  }
}