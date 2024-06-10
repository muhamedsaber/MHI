import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/features/patient/saved/presentation/Logic/cubit/saved_doctors_cubit.dart';
import 'package:mhi/features/patient/saved/presentation/Logic/cubit/saved_doctors_state.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/widgets/doctor_book_card_details.dart';

class SavedDoctorsTabe extends StatefulWidget {
  const SavedDoctorsTabe({super.key});

  @override
  State<SavedDoctorsTabe> createState() => _SavedDoctorsTabeState();
}

class _SavedDoctorsTabeState extends State<SavedDoctorsTabe> {
  @override
  void initState() {
    getIt<SavedDoctorsCubit>().getSavedDoctors();

    super.initState();
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
        return state.doctors.isEmpty
            ? const NoDataFound(
                message: "القائمة فارعة",
                icon: Icons.saved_search_rounded,
              )
            : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics:const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: state.doctors.length,
                      itemBuilder: (context, index) {
                        return DoctorBookCardDetails(
                          model: state.doctors[index],
                          onTap: () {},
                        );
                      },
                    ),
                ),
                 SizedBox(height: 60.h,)
              ],
            );
      } else {
        return const NoDataFound(
          message: "لم يتم العثور علي أطباء",
        );
      }
    });
  }
}
