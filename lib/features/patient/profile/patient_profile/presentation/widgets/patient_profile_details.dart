import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/common_ui/widgets/profile_card.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
import 'package:mhi/features/patient/profile/get_patient_profile/Logic/cubit/get_patient_information.dart';
import 'package:mhi/features/patient/profile/get_patient_profile/Logic/cubit/get_patient_information_state.dart';
import 'package:mhi/features/patient/profile/patient_profile/presentation/widgets/patient_information_data.dart';

class PatientProfileDetails extends StatefulWidget {
  const PatientProfileDetails({super.key, required this.widget});
  final Widget widget;
  @override
  State<PatientProfileDetails> createState() => _PatientProfileDetailsState();
}

class _PatientProfileDetailsState extends State<PatientProfileDetails> {
  @override
  void initState() {
    getIt<GetPatientInformationCubit>().getPatientFromCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPatientInformationCubit, GetPatientInformationState>(
      builder: (context, state) {
      return  state.when(initial: () {
          return const SizedBox.shrink();
        }, loading: () {
          return const Center(child:CircularProgressIndicator(),);
        }, loaded: (s) {
          return PatientInformationData(
            model: s,
            widget: widget.widget,
          );
        }, error: (e) {
          return PatientInformationData(
            model: PatientModel(),
            widget: widget.widget,
          );
        });
     
      },
    );
  }
}

