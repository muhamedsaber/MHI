import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_smooth_page_indicator.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_padding.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/data/models/booking_hospital_model.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/logic/doctors/cubit/get_doctors_by_hospital_cubit.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/widgets/hospitals/booking_hospital_card.dart';

class BookingHospitalCardListViewBuilder extends StatefulWidget {
  const BookingHospitalCardListViewBuilder(
      {super.key, required this.hospitalsModel});
  final AllBookingHospitalsModel hospitalsModel;
  @override
  State<BookingHospitalCardListViewBuilder> createState() =>
      _BookingHospitalCardListViewBuilderState();
}

class _BookingHospitalCardListViewBuilderState
    extends State<BookingHospitalCardListViewBuilder> {
  @override
  void initState() {
    super.initState();
  }

  final PageController pageController = PageController();
  int lenght = 0;
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    lenght = widget.hospitalsModel.hospitals?.length ?? 0;
    return Column(
      children: [
        Padding(
          padding: AppPadding.symmetricHorizontalMedium,
          child: SizedBox(
              height: 150.h,
              child: ListView.builder(
                controller: pageController,
                itemCount: lenght,
                reverse: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return BookingHospitalCard(
                    hospitalModel: widget.hospitalsModel.hospitals?[index] ??
                        BookingHospitalModel(),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      context.read<GetDoctorsByHospitalCubit>().getDoctors(
                          hospitalId:
                              widget.hospitalsModel.hospitals![index].id!);
                    },
                    backgroundColor: selectedIndex == index
                        ? AppColors.lightGreen
                        : context.theme.colorScheme.surface,
                    textColor: selectedIndex == index
                        ? Colors.white
                        : context.theme.colorScheme.onSurface,
                  );
                },
              )),
        ),
        verticleSpace(10),
        lenght > 10
            ? const SizedBox.shrink()
            : CustomSmoothPageIndicator(
                pageController: pageController, count: lenght),
      ],
    );
  }
}
