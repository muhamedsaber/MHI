import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    super.key,
    required this.currentMonth,
    required this.isPreviousMonthAvailable,
    required this.isNextMonthAvailable,
    required this.onPrevious,
    required this.onNext,
  });

  final String currentMonth;
  final bool isPreviousMonthAvailable;
  final bool isNextMonthAvailable;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            alignment: Alignment.center,
            onPressed: isNextMonthAvailable ? onNext : null,
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20.h,
            ),
            style: buttonStyle(context)),
        Text(
          currentMonth,
          style: AppTextStyles.jannat21BoldOnSurface(context),
        ),
        IconButton(
            alignment: Alignment.center,
            onPressed: isPreviousMonthAvailable ? onPrevious : null,
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20.h,
            ),
            style: buttonStyle(context)),
      ],
    );
  }
  

  /// custom [button_style] to reduce code duplication
  ButtonStyle buttonStyle(BuildContext context) {
    return ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(
        context.theme.colorScheme.onSurface.withOpacity(0.2),
      ),
    );
  }
}
