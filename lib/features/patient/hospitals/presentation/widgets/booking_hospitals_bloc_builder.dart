import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/hospitals/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/hospitals/all_hospitals_state.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/booking_hospital_card_listview_builder.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/booking_hospitals_shimmer.dart';

class BookingHospitalsBlocBuilder extends StatelessWidget {
  const BookingHospitalsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllHospitalsCubit, AllHospitalsState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const BookingHospitalsCardShimmer();
          },
          loading: () {
            return const BookingHospitalsCardShimmer();
          },
          loaded: (hospitals) {
            return BookingHospitalCardListViewBuilder(
              hospitalsModel: hospitals,
            );
          },
          error: (message) {
            return Padding(
              padding: EdgeInsets.only(top: 200.h),
              child: NoDataFound(message: message),
            );
          },
        );
      },
    );
  }
}

