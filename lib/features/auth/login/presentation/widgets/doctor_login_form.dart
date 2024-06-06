import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_cubit.dart';
import 'package:mhi/features/auth/login/presentation/widgets/doctor_login_bloc_listener.dart';
import 'package:mhi/features/auth/login/presentation/widgets/login_textfield.dart';
import 'package:mhi/features/auth/login/presentation/widgets/textfield_description.dart';

class DoctorLoginForm extends StatefulWidget {
  const DoctorLoginForm({super.key});

  @override
  State<DoctorLoginForm> createState() => _DoctorLoginFormState();
}

class _DoctorLoginFormState extends State<DoctorLoginForm> {
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
            controller: context.read<LoginCubit>().doctorUsernameController,
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
            controller: context.read<LoginCubit>().doctorPasswordController,
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
                context.read<LoginCubit>().loginDoctor();
              } else {
                Alerts().showCustomToast(
                    message: "يجب ادخال البيانات", color: AppColors.lightRed);
              }
            },
            buttonTextSize: 18.sp,
            backGroundColor: AppColors.lightGreen,
            buttonWidth: 200.w,
          ),
          const DoctorLoginBlocListener()
        ],
      ),
    );
  }
}
