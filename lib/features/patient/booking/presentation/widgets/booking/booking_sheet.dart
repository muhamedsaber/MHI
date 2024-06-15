import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/booking/booking_sheet_body.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class BookingSheet extends StatelessWidget {
  const BookingSheet({super.key, required this.doctorBookData});
  final DoctorBookData doctorBookData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 600.h,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          verticleSpace(10),
          Container(
            height: 5.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onSurface.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          BookingSheetBody(
            doctorBookData: doctorBookData,
          ),
        ],
      ),
    );
  }
}
