import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/patient/profile/patient_profile/presentation/Functions/log_out_patient.dart';

class PatientLogoutSheetBody extends StatefulWidget {
  const PatientLogoutSheetBody({super.key});

  @override
  State<PatientLogoutSheetBody> createState() => _PatientLogoutSheetBodyState();
}

class _PatientLogoutSheetBodyState extends State<PatientLogoutSheetBody> {
  bool isConfirmed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      height: 300.h,
      width: context.width,
      child: Column(
        children: [
          verticleSpace(15),
          Text("هل تريد تسجيل الخروج؟",
              style: AppTextStyles.jannat20BoldWhite
                  .copyWith(color: context.theme.colorScheme.onSurface)),
          verticleSpace(20),
          Icon(
            Icons.logout_outlined,
            size: 50.w,
            color: context.theme.colorScheme.primary,
          ),
          verticleSpace(10),
          Text("سيتم حذف بياناتك من داخل التطبيق",
              style: AppTextStyles.jannat18BoldWhite
                  .copyWith(color: context.theme.colorScheme.primary)),
          verticleSpace(15),
          // هل توافق علي الشروط والأحكام
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("هل توافق علي الشروط والأحكام؟",
                  style: AppTextStyles.jannat18BoldWhite.copyWith(
                    color:
                        isConfirmed ? AppColors.lightGreen : AppColors.lighGrey,
                  )),
              Checkbox(
                value: isConfirmed,
                onChanged: (value) {
                  setState(() {
                    isConfirmed = value ?? false;
                  });
                },
              ),
            ],
          ),
          verticleSpace(20),
          CustomButton(
            buttonText: "تأكيد",
            onPressed: () async {
              if (isConfirmed) {
                await logOut();
              } else {
                Alerts().showCustomToast(
                    message: "يرجى الموافقة علي الشروط والأحكام",
                    color: AppColors.lightRed);
              }
            },
            buttonTextSize: 18.sp,
            backGroundColor: AppColors.lightGreen,
            buttonWidth: 200.w,
          )
        ],
      ),
    );
  }

  logOut() async {
     context.read<LoginCubit>().logout();
    await PatientLogout.logoutPatient();
 
    await Future.delayed(const Duration(seconds: 1), () {
      navigateToLoginView(context);
    });
  }

  navigateToLoginView(BuildContext context) {
    context.navigateToAndReplace(Routes.loginView);
  }
  
}
