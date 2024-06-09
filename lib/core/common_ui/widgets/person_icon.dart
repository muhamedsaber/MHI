import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';

class PersonIcon extends StatelessWidget {
  const PersonIcon({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.w,
        width: size.w,
        decoration: BoxDecoration(
            color: context.theme.colorScheme.onSurface.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r)),
        child: Icon(
          Icons.person,
          color: AppColors.lighBlue,
          size: size * 0.8,
        ));
  }
}
