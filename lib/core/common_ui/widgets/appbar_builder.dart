import 'package:flutter/material.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

AppBar appBarBuilder({required BuildContext context, required String title}) {
  return AppBar(
    toolbarHeight: 60,
    elevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    leading: Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 10),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Image.asset(
          Assets.takebackIconDark,
          height: 30,
        ),
      ),
    ),
    title: Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Text(title,
            style: AppTextStyles.jannat24BoldBoldOnPrimary(context)
                .copyWith(color: AppColors.lighBlue)),
      ),
    ),
  );
}
