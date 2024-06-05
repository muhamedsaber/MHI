import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/tabbar_toggle.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/auth/login/presentation/widgets/doctor_login_form.dart';
import 'package:mhi/features/auth/login/presentation/widgets/patient_login_form.dart';
import 'package:mhi/features/auth/login/presentation/widgets/top_text_description.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  bool isDoctorPressed = false;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    tabController.addListener(() {
      if (tabController.index == 0) {
      } else {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightWhite,
      body: Column(
        children: [
          verticleSpace(80),
          isDoctorPressed
              ? const TopTextDescription(
                  title: AppStrings.loginHeadline,
                  description: AppStrings.loginDoctorDescription,
                  dividerColor: AppColors.deepBlue,
                )
              : const TopTextDescription(
                  title: AppStrings.loginHeadline,
                  description: AppStrings.loginUserDescription,
                  dividerColor: AppColors.lightGreen,
                ),
          verticleSpace(20),
          TabBarToggel(
            tabController: tabController,
            firstTabText: AppStrings.doctorKeyWord,
            secondTabText: AppStrings.userKeyWord,
          ),
          verticleSpace(30),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: 400.h,
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    DoctorLoginForm(),
                    PatientLoginForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
