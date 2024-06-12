import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/cubit/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/booking_hospitals_bloc_builder.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/get_doctors_by_hospitals_bloc_builder.dart';

class BookHospitalsView extends StatefulWidget {
  const BookHospitalsView({super.key});

  @override
  State<BookHospitalsView> createState() => _BookHospitalsViewState();
}

class _BookHospitalsViewState extends State<BookHospitalsView> {
  @override
  void initState() {
    getIt<AllHospitalsCubit>().getAllHospitals();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(context: context, title: "حجز موعد"),
      body: Column(
        children: [
          verticleSpace(10),
          const BookingHospitalsBlocBuilder(),
          verticleSpace(20),
          const GetDoctorsByHospitalIdBlocBuilder()
        ],
      ),
    );
  }
}

