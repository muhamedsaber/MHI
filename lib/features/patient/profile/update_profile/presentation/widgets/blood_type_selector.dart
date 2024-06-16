
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';

class BloodTypeSelector extends StatelessWidget {
  const BloodTypeSelector({super.key, required this.onSelected});
  final Function(String) onSelected;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Container(
        width: 300.w,
        height: 50.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: context.theme.colorScheme.onSurface.withOpacity(0.73),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("فصيلة الدم",
                style: AppTextStyles.jannat21BoldOnPrimary(context)),
            Icon(
              Icons.arrow_drop_down_sharp,
              size: 30.w,
              color: AppColors.lightGreen,
            ),
          ],
        ),
      ),
      onSelected: (value) {
        onSelected(value.toString());
      },
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            value: "A+",
            child: Text("A+"),
          ),
          PopupMenuItem(
            value: "A-",
            child: Text("A-"),
          ),
          PopupMenuItem(
            value: "B+",
            child: Text("B+"),
          ),
          PopupMenuItem(
            value: "B-",
            child: Text("B-"),
          ),
          PopupMenuItem(
            value: "AB+",
            child: Text("AB+"),
          ),
          PopupMenuItem(
            value: "AB-",
            child: Text("AB-"),
          ),
          PopupMenuItem(
            value: "O+",
            child: Text("O+"),
          ),
          PopupMenuItem(
            value: "O-",
            child: Text("O-"),
          ),
        ];
      },
    );
  }
}
