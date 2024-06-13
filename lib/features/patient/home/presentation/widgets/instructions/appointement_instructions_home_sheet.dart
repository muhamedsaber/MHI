import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';

class AppointmentInstructionBottomSheet extends StatelessWidget {
  const AppointmentInstructionBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.lighGrey,
                  ),
                ),
                Text(
                  "ارشادات الحجز",
                  style: AppTextStyles.jannat20BoldWhite.copyWith(
                    fontSize: 24.sp,
                    color: AppColors.lightGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return DataWideShape(
                      title: titles[index], value: irshadat[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> titles = [
  "المستشفيات",
  "التخصصات",
  "الأطباء",
  "البحث عن الأطباء",
  "الموعد"
];
List<String> irshadat = [
  "اختر المستشفى المناسبة لك من خلال البحث أو التصفح",
  "حدد التخصص المناسب لحالتك الصحية ثم عرض الأطباء المتخصصين في هذا التخصص",
  "ابحث عن الطبيب المتخصص المناسب لك من خلال اسمه أو تخصصه",
  "كما يمكنك البحث عن الأطباء المتخصصين في مستشفى معين",
  "يمكنك تحديد موعد الحجز عن طريق اختيار التاريخ المناسب لك من خلال جدول المواعيد المتاحة للطبيب"
];
