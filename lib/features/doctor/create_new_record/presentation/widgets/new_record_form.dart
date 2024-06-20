import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/cubit/create_new_record_cubit.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/widgets/diagnose_bloc_builder.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/widgets/edit_info_textfield.dart';

class NewRecordForm extends StatelessWidget {
  const NewRecordForm({super.key, required this.model});
  static final _formKey = GlobalKey<FormState>();
  final DoctorAppointementModel model;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Expanded(
          child: ListView(
            children: [
              verticleSpace(20),
              EditInfoTextField(
                controller:
                    context.read<CreateNewRecordCubit>().diagnoseController,
                hintText: "تشخيص المرض",
                keyboardType: TextInputType.text,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "الرجاء إدخال التشخيص";
                  }
                  return null;
                },
              ),
              verticleSpace(10),
              EditInfoTextField(
                controller:
                    context.read<CreateNewRecordCubit>().medicineController,
                hintText: "العلاج",
                keyboardType: TextInputType.text,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "الرجاء إدخال العلاج";
                  }
                  return null;
                },
              ),
              verticleSpace(20),
              TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<CreateNewRecordCubit>().addDiagnose();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "إضافة تشخيص جديد",
                        style: AppTextStyles.jannat18LightBlue.copyWith(
                            color: context.theme.colorScheme.onSurface),
                      ),
                      Icon(
                        Icons.add,
                        color: context.theme.colorScheme.onSurface,
                        size: 20.sp,
                      )
                    ],
                  )),
              const DiagnosesBlocBuilder(),
              verticleSpace(20),
              CustomButton(
                  buttonText: "إنشاء تقرير",
                  onPressed: () {
                    context
                        .read<CreateNewRecordCubit>()
                        .createNewRecord(patientId: model.patientId?.id ?? "");
                  },
                  buttonTextSize: 20.sp,
                  backGroundColor: context.theme.colorScheme.primary,
                  buttonWidth: context.width),
              verticleSpace(20),
            ],
          ),
        ));
  }
}

