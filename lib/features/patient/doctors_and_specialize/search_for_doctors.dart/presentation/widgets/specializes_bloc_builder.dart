import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/specialize/specializes_cubit.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/specializes_card_list_view.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/widgets/specializes_shimmer.dart';

class SpecializesBlocBuilder extends StatelessWidget {
  const SpecializesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializesCubit, SpecializesState>(
        builder: (context, state) {
      return state.when(
            initial: () {
              return const SizedBox.shrink();
            },
            loading: () {
              return SizedBox(height: 40.h, child: const SpecializesShimmer());
            },
            success: (specializations) {
              return SizedBox(
                  height: 42.h,
                  child: SpecializesListView(models: specializations));
            },
            error: (error) {
              return Center(
                  child: Text(
                error,
                style: AppTextStyles.jannat18BoldOnPrimary(context),
              ));
            },
          ) ??
          const SizedBox.shrink();
    });
  }
}
