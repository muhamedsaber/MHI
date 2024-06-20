import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/doctor/profile/data/doctor_specialize_detector.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/cubit/request_new_surgery_cubit.dart';

class SpeciaizeSelector extends StatelessWidget {
  const SpeciaizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownMenu(
          onSelected: (value) {
            context.read<RequestNewSurgeryCubit>().specialize = value;
          },
          menuHeight: 300.h,
          width: 370,
          textStyle: AppTextStyles.jannat18BoldWhite
              .copyWith(color: context.theme.colorScheme.onSurface),
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "اختر التخصص",
              style: AppTextStyles.jannat18BoldWhite
                  .copyWith(color: context.theme.colorScheme.onSurface),
            ),
          ),
          menuStyle: MenuStyle(
            shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            backgroundColor:
                WidgetStateProperty.all(context.theme.colorScheme.surface),
          ),
          dropdownMenuEntries: [
            for (var item in DoctorSpecializeController.getSpecializes())
              DropdownMenuEntry(value: item.id, label: item.name)
          ]),
    );
  }
}
