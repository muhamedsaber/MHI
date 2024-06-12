import 'package:flutter/material.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/specializes/models/specialize_model.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/doctors/book_doctors_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/specialize_card.dart';

class SpecializesListView extends StatefulWidget {
  const SpecializesListView({super.key, required this.models});
  final List<SpecializeModel> models;

  @override
  State<SpecializesListView> createState() => _SpecializesListViewState();
}

class _SpecializesListViewState extends State<SpecializesListView> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetricHorizontalMedium,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.models.length,
        reverse: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            getIt<BookDoctorsCubit>().getDoctorsBySpezialideId(
                specializeId: widget.models[index].id);
          },
          child: SpecializeCard(
            model: widget.models[index],
            backgroundColor: selectedIndex == index
                ? context.theme.colorScheme.primary
                : context.theme.colorScheme.surface,
            textColor: selectedIndex == index
                ? context.theme.colorScheme.surface
                : context.theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
