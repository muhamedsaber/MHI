import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/widgets/appointement_shimmer_listview.dart';
import 'package:mhi/features/doctor/surgery/surgeries/presentation/cubit/get_doctor_surgeries_cubit.dart';
import 'package:mhi/features/doctor/surgery/surgeries/presentation/cubit/get_doctor_surgeries_state.dart';
import 'package:mhi/features/doctor/surgery/surgeries/presentation/widgets/surgery_listview.dart';

class SurgeriesBlocBuilder extends StatelessWidget {
  const SurgeriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorSurgeriesCubit, GetDoctorSurgeriesState>(
      builder: (context, state) {
        return state.when(initial: () {
          return const SizedBox.shrink();
        }, loading: () {
          return const AppointementsShimmerListView();
        }, success: (data) {
          return SurgeryListViewBuilder(surgeries: data);
        }, error: (e) {
          return Padding(
            padding: EdgeInsets.only(top: 130.h),
            child: const NoDataFound(
                message: "لا يوجد عمليات قادمة", icon: Icons.calendar_month),
          );
        });
      },
    );
  }
}
