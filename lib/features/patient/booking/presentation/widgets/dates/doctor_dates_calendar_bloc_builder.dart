import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/patient/booking/presentation/logic/dates/cubit/get_doctor_days_cubit.dart';
import 'package:mhi/features/patient/booking/presentation/logic/dates/cubit/get_doctor_days_state.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/dates/custom_months_calender.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/dates/doctor_dates_calender_shimmer.dart';

class DoctorDatesCalenderBlocBuilder extends StatelessWidget {
  const DoctorDatesCalenderBlocBuilder({super.key, required this.doctorId,
  
  required this.onDateSelected
  });
  final String doctorId;
  final Function(String) onDateSelected;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorDaysCubit, GetDoctorDaysState>(
      builder: (context, state) {
        return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const CalenderShimmer(),
            loaded: (dates) {
              return dates.isEmpty
                  ? const NoDataFound(
                      message: "لا يوجد مواعيد متاحة",
                      icon: Icons.calendar_today_outlined)
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomMonthCalendar(
                        onDateSelected:onDateSelected,
                        dates: dates,
                        doctorId: doctorId,
                      ),
                    );
            },
            error: (errorMessage) {
              return NoDataFound(
                message: errorMessage,
                icon: Icons.error_outline,
              );
            });
      },
    );
  }
}
