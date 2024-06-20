import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/logic/cubit/doctor_appointements_cubit.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/logic/cubit/doctor_appointements_state.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/widgets/appointement_shimmer_listview.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/presentation/widgets/doctor_appointements_listview_builder.dart';

class DoctorAppointementsBlocBuilder extends StatelessWidget {
  const DoctorAppointementsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAppointementsCubit, DoctorAppointementsState>(
      builder: (context, state) {
        return state.when(
            initial: () => const AppointementsShimmerListView(),
            loading: () => const AppointementsShimmerListView(),
            success: (data) {
              return DoctorAppointementsListViewBuilder(
                appointements: data,
              );
            },
            error: (error) => Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child:const NoDataFound(
                    message: "لا يوجد مواعيد اليوم",
                    icon: Icons.calendar_month,
                  ),
                ));
      },
    );
  }
}
