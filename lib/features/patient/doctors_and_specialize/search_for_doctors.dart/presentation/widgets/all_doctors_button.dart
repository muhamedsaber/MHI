import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/presentation/logic/doctors/book_doctors_cubit.dart';

class AllDoctorsButton extends StatelessWidget {
  const AllDoctorsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: 45.w,
      child: IconButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            shadowColor: AppColors.deepBlue.withOpacity(0.2),
            backgroundColor: context.theme.colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onPressed: () {
            context.read<BookDoctorsCubit>().getAllDoctors();
          },
          icon:const Icon(Icons.panorama_horizontal_rounded)),
    );
  }
}
