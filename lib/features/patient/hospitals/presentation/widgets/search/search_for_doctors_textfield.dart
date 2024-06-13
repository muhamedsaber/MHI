import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/doctors/cubit/get_doctors_by_hospital_cubit.dart';

class SearchForDoctorsTextField extends StatelessWidget {
  const SearchForDoctorsTextField({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: TextField(
        onChanged:filterDoctorsList ,
        style: AppTextStyles.jannat20BoldWhite.copyWith(
          color: context.theme.colorScheme.onSurface,
          decorationThickness: 0,
        ),
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: "ابحث عن طبيب",
          hintStyle: AppTextStyles.jannat20BoldWhite.copyWith(
            color: AppColors.lighGrey,
          ),
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          prefixIcon:
              IconButton(onPressed: onPressed, icon: const Icon(Icons.close)),
        ),
      ),
    );
  }
  filterDoctorsList(String? input){
    getIt<GetDoctorsByHospitalCubit>().filterDoctors(input);
  }
}