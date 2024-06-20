import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/logic/cubit/open_fda_drugs_cubit.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/views/auto_complete_fda_search_textfield.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/views/fda_drugs_bloc_builder.dart';

class OpenFdaDrugsView extends StatefulWidget {
  const OpenFdaDrugsView({super.key});

  @override
  State<OpenFdaDrugsView> createState() => _OpenFdaDrugsViewState();
}

class _OpenFdaDrugsViewState extends State<OpenFdaDrugsView> {
  @override
  void initState() {
    context.read<OpenFdaDrugsCubit>().getRandomDrugs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder(context: context, title: "منظمة الغذاء والدواء"),
        body: Column(
          children: [
            verticleSpace(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const SearchForFdaDrugsTextField(),
            ),
            verticleSpace(10),
            const FdaDrugsBlocBuilder(),
          ],
        ));
  }
}
