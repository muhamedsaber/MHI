import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/Logic/saved_doctors/cubit/saved_doctors_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/doctor_book_card_details.dart';

class SavedDoctorsListViewBuilder extends StatelessWidget {
  const SavedDoctorsListViewBuilder({super.key, required this.doctors});
  final List<DoctorBookData> doctors;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              context
                  .read<SavedDoctorsCubit>()
                  .deleteDoctor(model: doctors[index]);
            },
            child: GestureDetector(
              onTap: () {
                Navigator.of(context,rootNavigator: true).pushNamed(
                  Routes.doctorBookingProfileView,
                  arguments: doctors[index],
                );
              },
              child: DoctorBookCardDetails(
                model: doctors[index],
                onFavoriteIconTapped: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
