import 'package:flutter/widgets.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/widgets/doctor_book_card.dart';

class DoctorBookCardListViewBuilder extends StatelessWidget {
  const DoctorBookCardListViewBuilder({super.key,
  required this.model
  });
final BookDoctorsModel model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: model.doctors.length,
        itemBuilder: (context, index) {
          return  DoctorBookCard(model: model.doctors[index],);
        },
      ),
    );
  }
}

