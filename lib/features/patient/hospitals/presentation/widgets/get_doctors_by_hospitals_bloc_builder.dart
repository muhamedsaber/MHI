
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/doctors/cubit/get_doctors_by_hospital_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/doctors/cubit/get_doctors_by_hospital_state.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/doctor_book_card_list_view_builder.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/doctors_shimmer_listviewbuilder.dart';

class GetDoctorsByHospitalIdBlocBuilder extends StatelessWidget {
  const GetDoctorsByHospitalIdBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorsByHospitalCubit, GetDoctorsByHospitalState>(
      builder: (context, state) {
        return state.when(initial: () {
          return Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: const NoDataFound(
              message: "اختر مستشفي لعرض الأطباء",
              icon: Icons.check_box_outline_blank_outlined,
            ),
          );
        }, loading: () {
          return const DoctorBookCardShimmer();
        }, loaded: (doctors) {
          return DoctorBookCardListViewBuilder(
            model: doctors,
          );
        }, error: (message) {
          return NoDataFound(message: message);
        });
      },
    );
  }
}