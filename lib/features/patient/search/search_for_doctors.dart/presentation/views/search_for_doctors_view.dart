import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/person_icon.dart';
import 'package:mhi/core/common_ui/widgets/search_textfield.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/logic/cubit/specializes_cubit.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/widgets/doctors_shimmer_listviewbuilder.dart';
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
    // context.read<BookDoctorsCubit>().getAllDoctors();

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
            const DoctorShimmerListViewBuilder()
          ],
        ));
  }
}

class DoctorBookCard extends StatelessWidget {
  const DoctorBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: context.width,
      child: Card(
        color: context.theme.colorScheme.surface,
        margin: AppPadding.symmetricHorizontalVerticalMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. John Doe',
                        style: AppTextStyles.jannat18BoldPrimaryColor(context),
                      )
                    ],
                  ),
                  horizontalSpace(10),
                  const PersonIcon(
                    size: 40,
                  )
                ],
              ),
              verticleSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. John Doe',
                        style: AppTextStyles.jannat18BoldPrimaryColor(context),
                      )
                    ],
                  ),
                  horizontalSpace(10),
                  Text(": التخصص",
                      style: AppTextStyles.jannat18BoldPrimaryColor(context))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
