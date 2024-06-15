import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/verified_title.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/booking/booking_bloc_listener.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/profile/doctor_booking_body.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/profile/doctor_booking_profile_appbar.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class DoctorBookingProfileView extends StatelessWidget {
  const DoctorBookingProfileView({super.key, required this.doctorBookData});
  final DoctorBookData doctorBookData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DoctorBookingProfileAppbar(),
          VerifiedTitle(
            title: doctorBookData.name ?? "غير معرف",
          ),
          verticleSpace(10),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
          ),
          DoctorBookingProfileBody(
            doctorBookData: doctorBookData,
          ),
          BookingBlocListener(),
        ],
      ),
    );
  }
}
