import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/doctors/cubit/get_doctors_by_hospital_cubit.dart';

class SearchForDoctorsTextField extends StatelessWidget {
  const SearchForDoctorsTextField({super.key, required this.onCloseButtonPressed});
  final void Function()? onCloseButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: TextField(
        onChanged: filterDoctorsList,
        style: AppTextStyles.jannat20BoldWhite.copyWith(
          color: context.theme.colorScheme.onSurface,
          decorationThickness: 0,
        ),
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: AppStrings.searchForDoctor,
          hintStyle: AppTextStyles.jannat20BoldWhite.copyWith(
            color: AppColors.lighGrey,
          ),
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          prefixIcon:
              IconButton(onPressed: onCloseButtonPressed, icon: const Icon(Icons.close)),
        ),
      ),
    );
  }

  /// Filter the doctors list based on the input
  filterDoctorsList(String? input) {
    getIt<GetDoctorsByHospitalCubit>().filterDoctors(input);
  }
}
