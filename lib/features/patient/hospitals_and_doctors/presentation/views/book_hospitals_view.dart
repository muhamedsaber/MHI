import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/toggle_doctor_hospital/toggle_doctor_hospital_cubit.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/toggle_doctor_hospital/toggle_doctor_hospital_state.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/doctors/cubit/get_doctors_by_hospital_cubit.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/hospitals/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/widgets/hospitals/booking_hospitals_bloc_builder.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/widgets/doctors/get_doctors_by_hospitals_bloc_builder.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/widgets/search/search_for_doctors_changer.dart';

class BookHospitalsView extends StatefulWidget {
  const BookHospitalsView({super.key});

  @override
  State<BookHospitalsView> createState() => _BookHospitalsViewState();
}

class _BookHospitalsViewState extends State<BookHospitalsView> {
  @override
  void initState() {
    resetDoctorState();
    getHospitals();
    super.initState();
  }

  /// Triggering the [cubit] to get all the [HospitalsList]
  getHospitals() {
    getIt<AllHospitalsCubit>().getAllHospitals();
  }

  /// clear the List of [Doctors] when the user open the [screen]
  /// to avoid showing the previous [Doctors] list and showing new initial state
  resetDoctorState() {
    getIt<GetDoctorsByHospitalCubit>().emitInitialDoctorsState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleDoctorHospitalCubit(),
      child: Scaffold(
        appBar: appBarBuilder(context: context, title: "حجز موعد"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            verticleSpace(20),
            const ToogleDoctorHospitalsBlocBuilder(),
            verticleSpace(20),
            const SearchForDoctorsChanger(),
            verticleSpace(20),
            const GetDoctorsByHospitalIdBlocBuilder()
          ],
        ),
      ),
    );
  }
}

class ToogleDoctorHospitalsBlocBuilder extends StatelessWidget {
  const ToogleDoctorHospitalsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleDoctorHospitalCubit, ToggleDoctorHospitalState>(
      builder: (context, state) {
        if (state is ToggleShowHospitals) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
            ],
          );
        } else if (state is ToggleHideHospitals) {
          return const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
