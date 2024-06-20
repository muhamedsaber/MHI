import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/theming.dart';

class DoctorAppointementsAppBar extends StatelessWidget {
  const DoctorAppointementsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  MainAppBar(
              gradient: AppThemeing.doctorGradient,
              widget: Container(
                margin: EdgeInsets.only(top: 65.h, left: 80.w, right: 80.w),
                padding: EdgeInsets.only(
                  top: 17.h,
                  bottom: 17.h,
                ),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("الحجوزات القادمة",
                      style: AppTextStyles.jannat21BoldOnSurface(context)),
                ),
              ));
  }
}