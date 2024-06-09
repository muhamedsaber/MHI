import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_padding.dart';

import 'package:mhi/core/helper/spacing.dart';

import 'package:mhi/features/patient/home/presentation/widgets/patient_topbar_card.dart';
import 'package:mhi/features/patient/home/presentation/widgets/search_for_doctor_card.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const PatientHomeCard(),
        verticleSpace(60),
        const SearchForDoctorsHomeView(),
        verticleSpace(30),
        SearchForHospitalCard()
      ],
    ));
  }
}

class SearchForHospitalCard extends StatelessWidget {
  const SearchForHospitalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: AppPadding.symmetricHorizontalVerticalMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  horizontalSpace(10),
                  Icon(Icons.home_rounded),
                ],
              )
            ],
          ),
        ));
  }
}
