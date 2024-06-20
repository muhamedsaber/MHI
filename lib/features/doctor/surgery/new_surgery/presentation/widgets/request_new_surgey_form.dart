import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/cubit/request_new_surgery_cubit.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/widgets/request_new_surgery_bloc_listener.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/widgets/specialize_selector.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/widgets/surgery_hospitals_bloc_builder.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/hospitals/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/widgets/edit_info_textfield.dart';

class RequestNewSurgeryForm extends StatefulWidget {
  const RequestNewSurgeryForm({super.key, required this.model});
  final DoctorAppointementModel model;
  @override
  State<RequestNewSurgeryForm> createState() => _RequestNewSurgeryFormState();
}

class _RequestNewSurgeryFormState extends State<RequestNewSurgeryForm> {
  clearOldData() {
    context.read<RequestNewSurgeryCubit>().clear();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getIt<AllHospitalsCubit>().getAllHospitals();
    clearOldData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          verticleSpace(20),
          const SpeciaizeSelector(),
          verticleSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: EditInfoTextField(
              hintText: "اذكر التفاصيل",
              controller:
                  context.read<RequestNewSurgeryCubit>().descriptionController,
              keyboardType: TextInputType.text,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return "يجب إدخال التفاصيل";
                }
              },
            ),
          ),
          verticleSpace(20),
          const SurgeryHospitalsBlocBuilder(),
          verticleSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
                buttonText: "تأكيد",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RequestNewSurgeryCubit>().requestNewSurgery(
                          patientId: widget.model.patientId?.id ?? "",
                        );
                  }
                },
                buttonTextSize: 20.sp,
                backGroundColor: context.theme.colorScheme.primary,
                buttonWidth: context.width),
          ),
          const RequestNewSurgeryBlocListener()
        ],
      ),
    );
  }
}
