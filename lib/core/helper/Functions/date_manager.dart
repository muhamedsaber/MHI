import 'package:intl/intl.dart';

abstract class DateManager {
  /// This function takes a [date] string and returns return the Month in Arabic
  static String convertEnglishMonthToArabicMonth(String date) {
    return arabicMonths[DateTime.parse(date).month - 1];
  }
  
  /// This function takes a [date] string and returns the month as String Like ["11"]
  static String getMonthFromDate(String date) {
    return DateTime.parse(date).month.toString();
  }
  

  /// This function takes a [date] string and returns the year as String Like ["2022"]
  static String getYearFromDate(String date) {
    return DateTime.parse(date).year.toString();
  }
 


 /// This Function responsible for getting the [Month] and [Year] from the [date]
 /// but in [Arabic] Language
  static String getMonthAndYear(String date) {
    return "${getYearFromDate(date)} ${convertEnglishMonthToArabicMonth(date)}";
  }
  


  /// This function takes a [date] string and returns the [day] of the [month]
  static int getDayFromDate(String date) {
    return DateTime.parse(date).day;
  }

  /// Parse the input [string] into a [DateTime] object
  /// and return the [month] and [year] only
  static DateTime parseMonthAndYear(String stringDate) {
    final parsedDate = DateTime.parse(stringDate);
    final monthAndYear = DateTime(parsedDate.year, parsedDate.month);
    return monthAndYear;
  }

  static String getArabicDayOfWeek(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);

    var locale = 'ar';

    var formatter = DateFormat.EEEE(locale);

    return formatter.format(dateTime);
  }


  
  /// This Method Used only on [CommonApiService.getDoctorTimesByDay]
  /// The Backend want the date in this format [YYYY-MM-DD]
  static String customDateFormateMMDDYYYY(String date) {
    return "${DateTime.parse(date).month}-${DateTime.parse(date).day}-${DateTime.parse(date).year}";
  }
}

List<String> arabicMonths = [
  "يناير",
  "فبراير",
  "مارس",
  "أبريل",
  "مايو",
  "يونيو",
  "يوليو",
  "أغسطس",
  "سبتمبر",
  "أكتوبر",
  "نوفمبر",
  "ديسمبر"
];

List<String> arabicDays = [
  "الأحد",
  "الإثنين",
  "الثلاثاء",
  "الأربعاء",
  "الخميس",
  "الجمعة",
  "السبت"
];
