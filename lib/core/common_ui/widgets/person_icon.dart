import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            color: context.theme.colorScheme.secondary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(1000.r)),
        child: Icon(
          Icons.person,
          color: context.theme.colorScheme.onSurface,
          size: size * 0.8,
        ));
  }
}
