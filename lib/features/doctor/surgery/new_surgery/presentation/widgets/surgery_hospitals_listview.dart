import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/cubit/request_new_surgery_cubit.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/data/models/booking_hospital_model.dart';

class SurgeryHospitalsListView extends StatefulWidget {
  const SurgeryHospitalsListView({super.key, required this.hospitals});
  final AllBookingHospitalsModel hospitals;

  @override
  State<SurgeryHospitalsListView> createState() =>
      _SurgeryHospitalsListViewState();
}

class _SurgeryHospitalsListViewState extends State<SurgeryHospitalsListView> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80.h,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:20.w),
          child: ListView.builder(
              itemCount: widget.hospitals.hospitals?.length ?? 0,
              reverse: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    context.read<RequestNewSurgeryCubit>().hospitalId =
                        widget.hospitals.hospitals?[index].id ?? "";
                  },
                  child: Card(
                    margin: EdgeInsets.only(bottom: 10.h, left: 20.w),
                    color: selectedIndex == index
                        ? AppColors.lightGreen
                        : context.theme.colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.hospitals.hospitals?[index].name ?? "",
                            style: AppTextStyles.jannat18BoldWhite.copyWith(
                              color: selectedIndex != index
                                  ? AppColors.lightGreen
                                  : context.theme.colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
