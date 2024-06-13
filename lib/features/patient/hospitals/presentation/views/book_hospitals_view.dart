import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/hospitals/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/booking_hospitals_bloc_builder.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/get_doctors_by_hospitals_bloc_builder.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/search/search_for_doctors_changer.dart';

class BookHospitalsView extends StatefulWidget {
  const BookHospitalsView({super.key});

  @override
  State<BookHospitalsView> createState() => _BookHospitalsViewState();
}

class _BookHospitalsViewState extends State<BookHospitalsView> {
  @override
  void initState() {
    getHospitals();
    super.initState();
  }

  /// Triggering the [cubit] to get all the [HospitalsList]
  getHospitals() {
    getIt<AllHospitalsCubit>().getAllHospitals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(context: context, title: "حجز موعد"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          verticleSpace(20),
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Text(
              "قائمة المستشفيات",
              style: AppTextStyles.jannat18BoldWhite
                  .copyWith(color: context.theme.colorScheme.onSurface),
            ),
          ),
          verticleSpace(10),
          const BookingHospitalsBlocBuilder(),
          verticleSpace(20),
          const SearchForDoctorsChanger(),
          verticleSpace(20),
          const GetDoctorsByHospitalIdBlocBuilder()
        ],
      ),
    );
  }
}
