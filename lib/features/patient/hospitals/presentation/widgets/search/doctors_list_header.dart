import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';

class DoctorListHeader extends StatelessWidget {
  final VoidCallback toggleSearch;

  const DoctorListHeader({super.key, required this.toggleSearch});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        IconButton(
          onPressed: toggleSearch,
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
    );
  }
}
