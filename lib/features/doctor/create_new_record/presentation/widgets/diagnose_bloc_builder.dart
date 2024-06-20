import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/doctor/create_new_record/data/models/new_record_request_body.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/cubit/create_new_record_cubit.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/cubit/create_new_record_state.dart';

class DiagnosesBlocBuilder extends StatelessWidget {
  const DiagnosesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewRecordCubit, CreateNewRecordState>(
      builder: (context, state) {
        return state.maybeWhen(
          diagnoseUpdated: (diagnoses) => diagnoseBuilder(diagnoses),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget diagnoseBuilder(List<Diagnose> diagnoses) {
    return Column(
      children: [
        const Divider(),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: diagnoses.length,
            itemBuilder: (context, index) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  title: Text(diagnoses[index].description,
                      style: AppTextStyles.jannat18LightBlue.copyWith(
                          color: context.theme.colorScheme.onSurface)),
                  subtitle: Text(diagnoses[index].medicine,
                      style: AppTextStyles.jannat18LightBlue.copyWith(
                          color: context.theme.colorScheme.onSurface,
                          fontSize: 14.sp)),
                  trailing: IconButton(
                      onPressed: () {
                        context
                            .read<CreateNewRecordCubit>()
                            .removeDiagnose(diagnoses[index]);
                      },
                      icon: const Icon(Icons.delete)),
                ),
              );
            }),
      ],
    );
  }
}
