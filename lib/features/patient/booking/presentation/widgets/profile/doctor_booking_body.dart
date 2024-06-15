import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/booking/booking_bloc_listener.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/booking/booking_sheet.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class DoctorBookingProfileBody extends StatelessWidget {
  const DoctorBookingProfileBody({super.key, required this.doctorBookData});
  final DoctorBookData doctorBookData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DataWideShape(
          title: "التخصص",
          value: doctorBookData.specialize?.name ?? "غير معرف",
        ),
        DataWideShape(
          title: "المستشفى",
          value: doctorBookData.hospitalId?.name ?? "غير معرف",
        ),
        DataWideShape(
          title: "الكود الخاص بالطبيب",
          value: doctorBookData.code ?? "غير معرف",
        ),
        verticleSpace(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomButton(
            buttonText: "حجز موعد",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => BookingSheet(
                  doctorBookData: doctorBookData,
                ),
              );
            },
            buttonTextSize: 20.sp,
            backGroundColor: AppColors.lightGreen,
            buttonWidth: context.width,
          ),
        ),
        verticleSpace(100),
      ],
    ));
  }
}
