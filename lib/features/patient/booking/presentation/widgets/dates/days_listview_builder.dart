import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/Functions/date_manager.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/booking/presentation/logic/times/cubit/get_doctor_times_cubit.dart';

class DaysListView extends StatefulWidget {
  const DaysListView(
      {super.key,
      required this.currentMonthDates,
      required this.doctorId,
      required this.onDateSelected});
  final String doctorId;
  final List<String> currentMonthDates;
  final Function(String)? onDateSelected;
  @override
  State<DaysListView> createState() => _DaysListViewState();
}

class _DaysListViewState extends State<DaysListView> {
  int? currentIndex;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.currentMonthDates.length,
        itemBuilder: (context, index) => _buildDayItem(context, index),
      ),
    );
  }

  Widget _buildDayItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
          widget.onDateSelected!(widget.currentMonthDates[index]);
        });

        getIt<GetDoctorTimesCubit>().getDoctorTiems(
            doctorId: widget.doctorId, day: getFormatedDateForRequest(index));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: currentIndex == index
              ? AppColors.lightGreen
              : context.theme.colorScheme.onSurface.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateManager.getDayFromDate(widget.currentMonthDates[index])
                  .toString(),
              style: AppTextStyles.jannat18LightBlue.copyWith(
                  color: currentIndex == index
                      ? Colors.white
                      : AppColors.lighBlue),
            ),
            Text(
              DateManager.getArabicDayOfWeek(widget.currentMonthDates[index]),
              style: AppTextStyles.jannat14OnSurface(context).copyWith(
                  color: currentIndex == index
                      ? Colors.white
                      : context.theme.colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }

  /// Here we are triggering the event bus with the selected date

  getFormatedDateForRequest(int index) {
    return DateManager.customDateFormateMMDDYYYY(
        widget.currentMonthDates[index]);
  }
}
