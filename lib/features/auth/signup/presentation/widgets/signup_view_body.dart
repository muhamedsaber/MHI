
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/auth/login/presentation/widgets/login_textfield.dart';
import 'package:mhi/features/auth/login/presentation/widgets/textfield_description.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:mhi/features/auth/signup/presentation/widgets/birthday_input.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  String? birthday;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          verticleSpace(20),
          const CustomTextFieldDescription(description: AppStrings.userName),
          verticleSpace(5),
          AuthTextField(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            textInputType: TextInputType.name,
            controller: context.read<SignupCubit>().patientUsernameController,
            hintText: AppStrings.enterUserName,
            validator: (s) {
              if (s.isNullOrEmpty()) {
                return AppStrings.youHaveToEnterUserName;
              }
              return null;
            },
          ),
          verticleSpace(10),
          const CustomTextFieldDescription(description: AppStrings.name),
          verticleSpace(5),
          AuthTextField(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            textInputType: TextInputType.name,
            controller: context.read<SignupCubit>().patientName,
            hintText: AppStrings.enterName,
            validator: (s) {
              if (s.isNullOrEmpty()) {
                return AppStrings.youHaveToEnterName;
              }
              return null;
            },
          ),
          verticleSpace(10),
          const CustomTextFieldDescription(description: AppStrings.password),
          verticleSpace(5),
          AuthTextField(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            textInputType: TextInputType.name,
            controller: context.read<SignupCubit>().patientPasswordController,
            hintText: AppStrings.enterPassword,
            validator: (s) {
              if (s.isNullOrEmpty()) {
                return AppStrings.youHaveToEnterPassword;
              }
              return null;
            },
          ),
          verticleSpace(10),
          BirthdayInput(
            onDateSelected: (p0) {
              setState(() {
                birthday = p0;
              });
            },
          ),
          verticleSpace(10),
          CustomButton(
            buttonText: "إنشاء حساب جديد",
            onPressed: () {
              if (context
                  .read<SignupCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
                if (birthday == null) {
                 Alerts().showCustomToast(
                      message: AppStrings.youHaveToEnterYourBirthDay,
                      color: AppColors.lightRed);
                } else {
                  context.read<SignupCubit>().signup(birthday: birthday!);
                }
              }
            },
            buttonTextSize: 18.sp,
            backGroundColor: AppColors.lightGreen,
            buttonWidth: 200.w,
          ),
        ],
      ),
    );
  }
}
