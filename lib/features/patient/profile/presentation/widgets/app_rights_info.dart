import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';

appRightsInfo({required BuildContext context}) {
  Widget customText({String? title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title ?? "",
          textDirection: TextDirection.rtl,
          style: AppTextStyles.jannat18BoldWhite.copyWith(
              color: context.theme.colorScheme.onSurface, fontSize: 15.sp),
        ),
        value == "" ? const SizedBox.shrink() : verticleSpace(10),
        Text(
          value,
          textDirection: TextDirection.rtl,
          style: AppTextStyles.jannat18BoldWhite.copyWith(
              color: context.theme.colorScheme.onSurface, fontSize: 23.sp),
        )
      ],
    );
  } //"عمرو محمد -رامز حسام - عبدالرحمن كشك - ابراهيم الفطراني"

  return showModalBottomSheet(
      backgroundColor: Theme.of(context).cardColor,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
            width: double.infinity,
            height:600.h,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                Image.asset(
                  Assets.assetsImagesColoredLogo,
                  height: 100.h,
                ),
                Text(
                  "1.1.1 إصدار التطبيق",
                  style: AppTextStyles.jannat20BoldWhite
                      .copyWith(color: context.theme.colorScheme.onSurface),
                ),
                verticleSpace(20),
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        AppStrings.rights,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.jannat20BoldWhite.copyWith(
                            color: context.theme.colorScheme.onSurface,
                            fontSize: 12.sp),
                      ),
                      verticleSpace(30),
                      customText(
                          title: "تم تنفيذ التطبيق بالكامل بواسطة ",
                          value: "محمد صابر حسانين سيد"),
                      verticleSpace(30),
                      customText(title: "بالتعاون مع", value: ""),
                      customText(
                          title:
                              "عمرو محمد -رامز حسام - عبدالرحمن كشك - ابراهيم الفطراني",
                          value: ""),
                      customText(
                          title: "تحت إشراف",
                          value: "د.احمد ابراهيم - د.اميرة السيد"),
                      verticleSpace(30)
                    ],
                  ),
                )
              ],
            ),
          ));
}
