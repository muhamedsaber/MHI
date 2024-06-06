import 'package:flutter/material.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/auth/login/presentation/widgets/top_text_description.dart';
import 'package:mhi/features/auth/signup/presentation/widgets/birthday_view_body.dart';
import 'package:mhi/features/auth/signup/presentation/widgets/signup_bloc_listener.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          verticleSpace(30),
          const TopTextDescription(
            title: AppStrings.youCanCreateAccountNow,
            description: AppStrings.onBoarding1String,
            dividerColor: AppColors.lighGrey,
          ),
          const SignupViewBody(),
          const SignupBlocListener()
        ],
      ),
    );
  }
}
