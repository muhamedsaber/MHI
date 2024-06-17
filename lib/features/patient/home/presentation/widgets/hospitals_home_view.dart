import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/home/presentation/widgets/instructions/appointement_instructions_home_sheet.dart';
import 'package:mhi/features/patient/home/presentation/widgets/instructions/patient_home_image_card.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/views/book_hospitals_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppointmentHomeScreen extends StatefulWidget {
  const AppointmentHomeScreen({
    super.key,
  });

  @override
  State<AppointmentHomeScreen> createState() => _AppointmentHomeScreenState();
}

class _AppointmentHomeScreenState extends State<AppointmentHomeScreen> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            EdgeInsets.only(top: 10.h, bottom: 30.h, right: 10.w, left: 10.w),
        width: 335.w,
        decoration: BoxDecoration(
            color: context.theme.brightness == Brightness.light
                ? context.theme.scaffoldBackgroundColor
                : context.theme.colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: context.theme.brightness == Brightness.light
                    ? AppColors.lighGrey.withOpacity(0.5)
                    : Colors.transparent,
                blurRadius: 50,
                spreadRadius: 7,
                offset: const Offset(0, 0),
              )
            ]),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SizedBox(
              width: 350.w,
              height: 110.h,
              child: ListView.builder(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Row(
                      children: [
                        PatientHomeImageCard(
                          buttontext: "المزيد",
                          image: Assets.docImage,
                          onTap: () async {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              useRootNavigator: true,
                              builder: (context) =>
                                  const AppointmentInstructionBottomSheet(),
                            );
                          },
                          secondColor: AppColors.lightRed,
                          text: "إرشادات الحجز",
                        ),
                        horizontalSpace(10),
                        PatientHomeImageCard(
                          buttontext: "المستشفيات",
                          image: Assets.hospitalView,
                          onTap: () async {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(
                              builder: (context) => const BookHospitalsView(),
                            ));
                          },
                          secondColor: AppColors.lightGreen,
                          text: "احجز موعدك الان",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 1,
              effect: ExpandingDotsEffect(
                dotHeight: 3.h,
                dotWidth: 80.w,
                dotColor: Colors.grey,
                activeDotColor: AppColors.lightGreen,
              ),
            )
          ],
        ),
      ),
    );
  }
}
