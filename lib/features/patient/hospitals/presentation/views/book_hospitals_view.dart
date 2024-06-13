import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/cubit/all_hospitals_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/booking_hospitals_bloc_builder.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/get_doctors_by_hospitals_bloc_builder.dart';

class BookHospitalsView extends StatefulWidget {
  const BookHospitalsView({super.key});

  @override
  State<BookHospitalsView> createState() => _BookHospitalsViewState();
}

class _BookHospitalsViewState extends State<BookHospitalsView> {
  @override
  void initState() {
    getIt<AllHospitalsCubit>().getAllHospitals();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(context: context, title: "حجز موعد"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          verticleSpace(20),
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Text(
              "قائمة المستشفيات",
              style: AppTextStyles.jannat18BoldWhite
                  .copyWith(color: context.theme.colorScheme.onSurface),
            ),
          ),
          verticleSpace(10),
          const BookingHospitalsBlocBuilder(),
          verticleSpace(20),
          const CustomSearchInHospitals(),
          verticleSpace(20),
          const GetDoctorsByHospitalIdBlocBuilder()
        ],
      ),
    );
  }
}

class CustomSearchInHospitals extends StatefulWidget {
  const CustomSearchInHospitals({super.key});

  @override
  State<CustomSearchInHospitals> createState() =>
      _CustomSearchInHospitalsState();
}

class _CustomSearchInHospitalsState extends State<CustomSearchInHospitals> {
  bool isSearchStarted = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: isSearchStarted
          ? Padding(
              key: const ValueKey(1),
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: TextField(
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
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearchStarted = !isSearchStarted;
                      });
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ),
            )
          : Row(
              key: const ValueKey(2),
              children: [
                SizedBox(width: 16), // horizontalSpace(16) equivalent
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchStarted = !isSearchStarted;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Text(
                    "قائمة الأطباء",
                    style: AppTextStyles.jannat18BoldWhite.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
