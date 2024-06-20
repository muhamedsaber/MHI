import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/Functions/date_manager.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/booking/presentation/logic/booking_process/cubit/booking_process_cubit.dart';
import 'package:mhi/features/patient/booking/presentation/logic/dates/cubit/get_doctor_days_cubit.dart';
import 'package:mhi/features/patient/booking/presentation/logic/dates/cubit/get_doctor_days_state.dart';
import 'package:mhi/features/patient/booking/presentation/logic/times/cubit/get_doctor_times_cubit.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/Times/doctor_times_bloc_builder.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/dates/doctor_dates_calendar_bloc_builder.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class BookingSheetBody extends StatefulWidget {
  const BookingSheetBody({super.key, required this.doctorBookData});
  final DoctorBookData doctorBookData;

  @override
  State<BookingSheetBody> createState() => _BookingSheetBodyState();
}

class _BookingSheetBodyState extends State<BookingSheetBody> {
  String? selectedDate;
  String? selectedTime;

  triggerDoctorAvailableDaysForBooking() {
    getIt<GetDoctorDaysCubit>()
        .getDoctorDaysById(doctorId: widget.doctorBookData.doctorId ?? "");
  }

  clearOldTimesList() {
    getIt<GetDoctorTimesCubit>().clearTimes();
  }

  @override
  void initState() {
    triggerDoctorAvailableDaysForBooking();
    clearOldTimesList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticleSpace(30),
        Text(
          "المواعيد المتاحة للحجز",
          style: AppTextStyles.jannat20BoldOnPrimaryColor(context).copyWith(
            color: context.theme.colorScheme.onSurface,
          ),
          textAlign: TextAlign.right,
        ),
        verticleSpace(20),
        DoctorDatesCalenderBlocBuilder(
          doctorId: widget.doctorBookData.doctorId ?? "",
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        verticleSpace(20),
        DoctorTimesBlocBuilder(
          onTimeSelected: (value) {
            setState(() {
              selectedTime = value;
            });
          },
        ),
        verticleSpace(20),
        BlocBuilder<GetDoctorDaysCubit, GetDoctorDaysState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loaded: (d) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  buttonText: "حجز الموعد",
                  onPressed: () {
                    if (selectedTime == null || selectedDate == null) {
                      Alerts().showCustomToast(
                          message: "يجب تحديد موعد الحجز",
                          color: AppColors.lightRed);
                    } else {
                      context.navigateBack();
                      getIt<BookingProcessCubit>().bookNewAppointement(
                          date: formateTheDate(selectedDate!),
                          time: selectedTime!,
                          doctorId: widget.doctorBookData.doctorId ?? "");
                    }
                  },
                  buttonTextSize: 20.sp,
                  backGroundColor: AppColors.lightGreen,
                  buttonWidth: context.width,
                ),
              ),
            );
          },
        )
      ],
    );
  }

  formateTheDate(String date) {
    return DateManager.customDateFormateMMDDYYYY(date);
  }
}
