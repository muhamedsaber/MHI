import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';

class EditInfoTextField extends StatelessWidget {
  const EditInfoTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.keyboardType});
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      validator: validator,
      decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          hintText: hintText,
          hintStyle: AppTextStyles.jannat18BoldOnPrimary(context).copyWith(
            color: context.theme.colorScheme.onSurface.withOpacity(0.7),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: border(context),
          enabledBorder: border(context),
          focusedBorder: border(context)),
    );
  }

  static InputBorder border(BuildContext context) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          BorderSide(width: 2.w, color: context.theme.colorScheme.onSurface));
}
