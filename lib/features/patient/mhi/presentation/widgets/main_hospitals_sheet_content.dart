import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/widgets/firebase_hospital_card.dart';
import 'package:mhi/features/patient/mhi/data/main_mhi_hospitals.dart';

class MainHospitalsSheetBody extends StatelessWidget {
  const MainHospitalsSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: context.width,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              height: 5.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColors.lighGrey,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          verticleSpace(20),
          Expanded(
            child: ListView.builder(
              itemCount: mainFacilities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.navigateTo(Routes.firebaseHospitalProfileView,
                        arguments: mainFacilities[index]);
                  },
                  child: FirebaseHospitalsCard(
                    hospital: mainFacilities[index],
                  ),
                );
              },
            ),
          ),
           verticleSpace(20),
        ],
      ),
    );
  }
}