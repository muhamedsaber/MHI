import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/Functions/date_manager.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/dates/calender_header.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/dates/days_listview_builder.dart';

class CustomMonthCalendar extends StatefulWidget {
  const CustomMonthCalendar(
      {super.key, required this.dates, required this.doctorId,
      required this.onDateSelected
      });
  final List<String> dates;
  final String doctorId;
  final Function(String)? onDateSelected;
  @override
  State<CustomMonthCalendar> createState() => _CustomMonthCalendarState();
}

class _CustomMonthCalendarState extends State<CustomMonthCalendar> {
  List<String> months = [];
  int currentMonth = 0;
  bool isNextMonthAvailable = false;
  bool isPreviousMonthAvailable = false;

  @override
  void initState() {
    super.initState();
    months = getFinalMonthsForUi(widget.dates);
    updateNavigationButtonsState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> currentMonthDates =
        getDatesForCurrentMonth(widget.dates, months[currentMonth]);

    return widget.dates.isEmpty
        ? const SizedBox.shrink()
        : Card(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    children: [
                      CalendarHeader(
                        currentMonth: months[currentMonth],
                        isPreviousMonthAvailable: isPreviousMonthAvailable,
                        isNextMonthAvailable: isNextMonthAvailable,
                        onPrevious: moveToPreviousMonth,
                        onNext: moveToNextMonth,
                      ),
                      verticleSpace(30),
                      DaysListView(
                        onDateSelected: widget.onDateSelected,
                        currentMonthDates: currentMonthDates,
                        doctorId: widget.doctorId,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  ///------------------------------------------------------------------------
  /// [Months_and_years]
  ///------------------------------------------------------------------------

  // This method is responsible for converting the month and year to Arabic
  // Like [2024 سبتمبر]
  convertMonthAndYearToArabic(DateTime date) {
    return DateManager.getMonthAndYear(date.toString());
  }

  /// This Method is responsible for [Removing_decoupled_months]
  /// It will remove the duplicated months from the list of dates
  /// and it will trigger the [convertMonthAndYearToArabic] method to convert
  /// the month and year to Arabic
  List<String> removeDuplicatedMonths(List<String> dates) {
    final uniqueMonths = <String>{};
    for (final date in dates) {
      final monthAndYear = DateManager.parseMonthAndYear(date);
      uniqueMonths.add(convertMonthAndYearToArabic(monthAndYear));
    }
    return uniqueMonths.toList();
  }

  /// This Method is responsible for [Getting_months]
  /// and calling [removeDuplicatedMonths] to remove the [duplicated] months
  List<String> getFinalMonthsForUi(List<String> dates) {
    List<String> uniqueMonths = removeDuplicatedMonths(dates);
    return uniqueMonths;
  }

  //// ---------------------------
  /// [Days_for_current_month]
  ///-----------------------------
  List<String> getDatesForCurrentMonth(List<String> dates, String month) {
    final List<String> monthDates = [];
    for (final date in dates) {
      final parsedDate = DateTime.parse(date);
      final monthYear = DateManager.getMonthAndYear(
          DateTime(parsedDate.year, parsedDate.month).toString());
      if (monthYear == month) {
        monthDates.add(date);
      }
    }
    return monthDates;
  }

  ///------------------------------------------------------------------------
  /// [Navigation]
  ///------------------------------------------------------------------------

  /// This Method is responsible for [Navigation] to the [next] month
  void moveToNextMonth() {
    if (currentMonth < months.length - 1) {
      setState(() {
        currentMonth++;
        updateNavigationButtonsState();
      });
    }
  }

  /// This Method is responsible for [Navigation] to the [previous] month
  void moveToPreviousMonth() {
    if (currentMonth > 0) {
      setState(() {
        currentMonth--;
        updateNavigationButtonsState();
      });
    }
  }

  /// This Method is responsible for [Updating_navigation_buttons]
  /// It will check if the current month is the first month or the last month
  /// and then it will update the state of the buttons to Prevent the user from
  /// going to the next month if the current month is the last month
  /// and Prevent the user from
  /// going to the previous month if the current month is the first month
  void updateNavigationButtonsState() {
    setState(() {
      isPreviousMonthAvailable = currentMonth > 0;
      isNextMonthAvailable = currentMonth < months.length - 1;
    });
  }
}
