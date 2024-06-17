import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/booking/booking_request_status_sheet.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/Logic/update_patient_profile_cubit.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/Logic/update_patient_profile_state.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/widgets/blood_type_selector.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/widgets/edit_info_textfield.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/widgets/update_profile_bloc_listener.dart';

class UpdatePatientProfileForm extends StatefulWidget {
  const UpdatePatientProfileForm({super.key});

  @override
  State<UpdatePatientProfileForm> createState() =>
      _UpdatePatientProfileFormState();
}

class _UpdatePatientProfileFormState extends State<UpdatePatientProfileForm> {
  String? bloodType;
  @override
  void initState() {
    getIt<UpdatePatientProfileCubit>().clear();
    super.initState();
  }
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Expanded(
            child: ListView(children: [
          verticleSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: EditInfoTextField(
                validator: validateMobile,
                keyboardType: TextInputType.number,
                hintText: "رقم الهاتف",
                controller:
                    getIt<UpdatePatientProfileCubit>().mobildNumberController),
          ),
          verticleSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: EditInfoTextField(
                keyboardType: TextInputType.number,
                validator: validateWeight,
                hintText: "الوزن Kg",
                controller:
                    getIt<UpdatePatientProfileCubit>().weightController),
          ),
          verticleSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: EditInfoTextField(
                keyboardType: TextInputType.number,
                validator: validateHeight,
                hintText: "الطول cm",
                controller:
                    getIt<UpdatePatientProfileCubit>().heightController),
          ),
          verticleSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: EditInfoTextField(
                hintText: "العنوان الشخصي",
                validator: validateAddress,
                controller:
                    getIt<UpdatePatientProfileCubit>().addressController),
          ),
          verticleSpace(20),
          BloodTypeSelector(
            onSelected: (value) {
              setState(() {
                bloodType = value;
              });
            },
          ),
          verticleSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
                buttonText: "حفظ",
                onPressed: () {
                  
                  if (bloodType == null) {
                    Alerts().showCustomToast(
                      color: AppColors.lightRed,
                      message: "برجاء اختيار فصيلة الدم",
                    );
                  }
                  if (formKey
                      .currentState!
                      .validate()) {
                
                    getIt<UpdatePatientProfileCubit>()
                        .updatePatientProfile(bloodType: bloodType!);
                  }
                },
                buttonTextSize: 20.sp,
                backGroundColor: context.theme.colorScheme.onSurface,
                buttonWidth: 200.w),
          ),
          const UpadeProfileBlocListener()
        ])));
  }

  /// Validate the input fields
  String? validateMobile(String? input) {
    if (input?.length == 11) {
      return null;
    } else {
      return "يجب إدخال رقم الهاتف بشكل صحيح";
    }
  }

  String? validateHeight(String? input) {
    // normel people height between 150 and 200 so its 3 digit number
    if (input!.isNotEmpty && input.length > 2 && input.length < 4) {
      return null;
    } else {
      return "يجب إدخال الطول بشكل صحيح";
    }
  }

  String? validateWeight(String? input) {
    if (input!.isNotEmpty && input.length > 1 && input.length < 4) {
      return null;
    } else {
      return "يجب إدخال الوزن بشكل صحيح";
    }
  }

  String? validateAddress(String? input) {
    if (input!.isNotEmpty && input.length > 5) {
      return null;
    } else {
      return "يجب إدخال العنوان بشكل صحيح";
    }
  }
}
