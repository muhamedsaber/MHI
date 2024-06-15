import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/widgets/custom_tabbar.dart';

class PatientAppointementAppbar extends StatelessWidget {
  const PatientAppointementAppbar({super.key,
  required this.tabController
  });
final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return MainAppBar(gradient: AppThemeing.patientGradient,
      widget:Padding(
        padding: EdgeInsets.only(top: 49.h),
        child: CustomTabBar(
          tabController: tabController,
          tabs: [
            Tab(
              child: Text(
                "المواعيد القادمة",
                style: AppTextStyles.jannat18BoldWhite,
              ),
            ),
            Tab(
              child: Text(
                "المواعيد السابقة",
                style: AppTextStyles.jannat18BoldWhite,
              ),
            ),
          ],
        ),
      ),
      );
  }
}