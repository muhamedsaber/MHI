import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/Logic/saved_doctors/cubit/saved_doctors_cubit.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/Logic/saved_doctors/cubit/saved_doctors_state.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/widgets/doctors/saved_doctors_listview.dart';

class SavedDoctorsTab extends StatefulWidget {
  const SavedDoctorsTab({super.key});

  @override
  State<SavedDoctorsTab> createState() => _SavedDoctorsTabState();
}

class _SavedDoctorsTabState extends State<SavedDoctorsTab> {
  @override
  void initState() {
    getTheSavedDoctors();
    super.initState();
  }

  /// trigger the cubit to get the saved doctors
  getTheSavedDoctors() {
    getIt<SavedDoctorsCubit>().getSavedDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedDoctorsCubit, SavedDoctorsState>(
        builder: (context, state) {
      if (state is SavedDoctorsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SavedDoctorsSuccess) {
        return successDoctorsStatus(state);
      } else {
        return const NoDataFound(
          message: "لم يتم العثور علي أطباء",
        );
      }
    });
  }

  successDoctorsStatus(SavedDoctorsSuccess state) {
    if (state.doctors.isEmpty) {
      return const NoDataFound(
        message: "القائمة فارعة",
        icon: Icons.saved_search_rounded,
      );
    } else {
      return Column(
        children: [
          SavedDoctorsListViewBuilder(
            doctors: state.doctors,
          ),
          verticleSpace(60)
        ],
      );
    }
  }
}
