import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/Theme/theme_extensions.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/logic/cubit/open_fda_drugs_cubit.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/logic/cubit/open_fda_drugs_state.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/views/fda_drugs_listview_builder.dart';
import 'package:shimmer/shimmer.dart';

class FdaDrugsBlocBuilder extends StatelessWidget {
  const FdaDrugsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpenFdaDrugsCubit, OpenFdaDrugsState>(
      builder: (context, state) {
        return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const DrugsShimmerListView(),
            loaded: (data) {
              return FdaDrugsListViewBuilder(result: data);
            },
            error: (e) {
              return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: NoDataFound(
                    message: e,
                    icon: Icons.error_outline_rounded,
                  ));
            });
      },
    );
  }
}

class DrugsShimmerListView extends StatelessWidget {
  const DrugsShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: context.theme.shimmerBaseColor(),
            highlightColor: context.theme.shimmerHighlghtColor(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
