import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/helper/app_strings.dart';

class SearchForDoctors extends StatelessWidget {
  const SearchForDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appBarBuilder(context: context, title: AppStrings.searchForDoctor),
        body: Column(
          children: [],
        ));
  }
} //SearchTextField
