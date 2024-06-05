import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/auth/login/presentation/widgets/do_not_have_account.dart';
import 'package:mhi/features/auth/login/presentation/widgets/login_textfield.dart';
import 'package:mhi/features/auth/login/presentation/widgets/textfield_description.dart';

class PatientLoginForm extends StatefulWidget {
  const PatientLoginForm({super.key});

  @override
  State<PatientLoginForm> createState() => _PatientLoginFormState();
}

class _PatientLoginFormState extends State<PatientLoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomTextFieldDescription(description: AppStrings.userName),
          verticleSpace(5),
          AuthTextField(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            textInputType: TextInputType.name,
            controller: TextEditingController(),
            hintText: AppStrings.enterUserName,
            validator: (s) {
              if (s.isNullOrEmpty()) {
                return AppStrings.youHaveToEnterUserName;
              }
              return null;
            },
          ),
          verticleSpace(10),
          const CustomTextFieldDescription(
            description: AppStrings.password,
          ),
          verticleSpace(5),
          AuthTextField(
            textAlign: TextAlign.right,
            textDirection: TextDirection.ltr,
            textInputType: TextInputType.emailAddress,
            controller: TextEditingController(),
            hintText: AppStrings.enterPassword,
            validator: (s) {
              if (s.isNullOrEmpty()) {
                return AppStrings.youHaveToEnterPassword;
              }
              return null;
            },
          ),
          verticleSpace(20),
          CustomButton(
              buttonText: AppStrings.loginKeyWord,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // context.read<LoginCubit>().loginPatient();
                }
              },
              buttonTextSize: 18.sp,
              backGroundColor: AppColors.lightGreen,
              buttonWidth: 200.w),
              verticleSpace(10),
          const DoNotHaveAnAccountWidget(),
          // const UserLoginBlocListener()
        ],
      ),
    );
  }
}
