import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';

class BookingRequestStatusSheet extends StatefulWidget {
  const BookingRequestStatusSheet({
    super.key,
    required this.message,
    required this.errorAnimationAsset,
  });
  final String message;
  final String errorAnimationAsset;

  @override
  State<BookingRequestStatusSheet> createState() =>
      _BookingRequestStatusSheetState();
}

class _BookingRequestStatusSheetState extends State<BookingRequestStatusSheet>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: context.width,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          verticleSpace(30),
          Lottie.asset(
              // make it keep playing

              width: 150.w,
              height: 150.h,
              fit: BoxFit.cover,
              widget.errorAnimationAsset,
              controller: _controller, onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          }),
          verticleSpace(20),
          Text(
            widget.message,
            style: AppTextStyles.jannat21BoldOnSurface(context),
          ),
        ],
      ),
    );
  }
}
