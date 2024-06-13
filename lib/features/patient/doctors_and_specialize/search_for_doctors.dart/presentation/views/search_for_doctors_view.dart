import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/search_textfield.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/cubit/specializes_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/doctors/book_doctors_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/doctors_book_card_bloc_builder.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/save_and_delete_doctor_bloc_listener.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/specializes_bloc_builder.dart';

class SearchForDoctors extends StatefulWidget {
  const SearchForDoctors({super.key});

  @override
  State<SearchForDoctors> createState() => _SearchForDoctorsState();
}

class _SearchForDoctorsState extends State<SearchForDoctors> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    initSpecializes();
    initDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appBarBuilder(context: context, title: AppStrings.searchForDoctor),
        body: Column(
          children: [
            verticleSpace(10),
            SearchTextField(
              controller: _controller,
              hintText: AppStrings.enterTheDoctorName,
              onChanged: filterDoctors,
            ),
            verticleSpace(15),
            const SpecializesBlocBuilder(),
            verticleSpace(10),
            const DoctorsBookCardBlocBuilder(),
            const SaveAndDeleteDoctorBlocListener()
          ],
        ));
  }

  initSpecializes() {
    context.read<SpecializesCubit>().getSpecializes();
  }

  initDoctors() {
    context.read<BookDoctorsCubit>().getAllDoctors();
  }

  filterDoctors(String? input) {
    context.read<BookDoctorsCubit>().filterDoctors(input: input);
  }
}
