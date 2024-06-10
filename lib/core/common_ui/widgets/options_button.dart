
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class OptionButton extends StatefulWidget {
  const OptionButton(
      {super.key,
      required this.icon,
      required this.value,
      required this.onTap,
      this.widget});

  final String value;
  final IconData icon;
  final void Function()? onTap;
  final Widget? widget;
  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: 70,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Theme.of(context).colorScheme.onSurface,
                    width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 5.w,
                ),
                widget.widget != null
                    ? widget.widget!
                    : Icon(
                        Icons.arrow_back_ios_new,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                const Spacer(),
                Text(
                  widget.value,
                  textAlign: TextAlign.end,
                  style: AppTextStyles.jannat18BoldWhite.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                widget.widget == null
                    ? Icon(
                        widget.icon,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 30,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
