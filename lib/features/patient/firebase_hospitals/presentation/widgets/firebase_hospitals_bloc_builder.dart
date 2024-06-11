import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/logic/cubit/firebase_hospitals_cubit.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/logic/cubit/firebase_hospitals_state.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/widgets/firebase_hospital_card.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/widgets/doctors_shimmer_listviewbuilder.dart';

class FirebaseHospitalsBlocBuilder extends StatefulWidget {
  const FirebaseHospitalsBlocBuilder({super.key});

  @override
  State<FirebaseHospitalsBlocBuilder> createState() =>
      _FirebaseHospitalsBlocBuilderState();
}

class _FirebaseHospitalsBlocBuilderState
    extends State<FirebaseHospitalsBlocBuilder> {
  @override
  void initState() {
    getIt<FirebaseHospitalsCubit>().getAllHospitals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseHospitalsCubit, FirebaseHospitalsState>(
        builder: (context, state) => state.when(
            initial: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            loading: () => const DoctorShimmerListViewBuilder(),
            loaded: (data) {
              return Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          context.navigateTo(Routes.firebaseHospitalProfileView,
                              arguments: data[index]);
                        },
                        child: FirebaseHospitalsCard(hospital: data[index]));
                  },
                ),
              );
            },
            error: (error) => Center(
                  child: NoDataFound(message: error),
                )));
  }
}
