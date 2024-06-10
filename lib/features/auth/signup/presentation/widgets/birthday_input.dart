import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_button.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';

class BirthdayInput extends StatefulWidget {
  final Function(String) onDateSelected;

  const BirthdayInput({super.key, required this.onDateSelected});

  @override
  State<BirthdayInput> createState() => _BirthdayInputState();
}

class _BirthdayInputState extends State<BirthdayInput> {
  DateTime? selectedDate;
  String formattedDate = "";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });

      formattedDate = '${picked.day}-${picked.month}-${picked.year}';
      widget.onDateSelected(formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomButton(
              buttonText: "اختر تاريخ الميلاد",
              onPressed: () => _selectDate(context),
              buttonTextSize: 18.sp,
              backGroundColor: AppColors.lighBlue,
              buttonWidth: context.width),
        ),
        verticleSpace(10),
        if (selectedDate != null)
          Text(
            'التاريخ الذي تم اختيارة هو : ${formattedDate.toString()}',
            style: AppTextStyles.jannat18BoldOnPrimary(context).copyWith(
              color: AppColors.lighBlue,
            ),
          ),
      ],
    );
  }
}
