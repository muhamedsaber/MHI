import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/search_textfield.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/logic/cubit/specializes_cubit.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/widgets/specializes_bloc_builder.dart';

class SearchForDoctors extends StatefulWidget {
  const SearchForDoctors({super.key});

  @override
  State<SearchForDoctors> createState() => _SearchForDoctorsState();
}

class _SearchForDoctorsState extends State<SearchForDoctors> {
  @override
  void initState() {
    context.read<SpecializesCubit>().getSpecializes();

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
              onSubmitted: (s) {},
              hintText: AppStrings.enterTheDoctorName,
              onButtonPressed: () {},
              onChanged: (p0) {},
            ),
            verticleSpace(5),
            const SpecializesBlocBuilder(),
             verticleSpace(10),
             

          ],
        ));
  }
}
