import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/search_textfield.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/spacing.dart';

class SearchForDoctors extends StatelessWidget {
  const SearchForDoctors({super.key});

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
            )
          ],
        ));
  }
} //SearchTextField
