import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/common/medicines/mhi_medicines/presentation/Logic/mhi_medicines/cubit/mhi_medicines_cubit.dart';
import 'package:mhi/features/common/medicines/mhi_medicines/presentation/Logic/mhi_medicines/cubit/mhi_medicines_state.dart';
import 'package:mhi/features/common/medicines/mhi_medicines/presentation/widgets/mhi_medicine_data_listview.dart';

class MhiMedicineBlocBuilder extends StatelessWidget {
  const MhiMedicineBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MhiMedicinesCubit, MhiMedicinesState>(
      builder: (context, state) {
        return state.when(
            initial: () => Container(),
            loading: () => Padding(
                padding: EdgeInsets.only(top: 150.h),
                child: const CircularProgressIndicator()),
            loaded: (model) => MhiMedicineDataListView(model: model),
            error: (message) => Padding(
                  padding: EdgeInsets.only(top: 120.h),
                  child: NoDataFound(message: message),
                ));
      },
    );
  }
}