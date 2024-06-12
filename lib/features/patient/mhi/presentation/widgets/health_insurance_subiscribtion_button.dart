import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/mhi/presentation/views/subscription_rules_view.dart';

class SubscribeInHealthInsurance extends StatelessWidget {
  const SubscribeInHealthInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.of(context,rootNavigator: true).push( MaterialPageRoute(builder: (context) {
           return SubscriptionRolesView();
         },));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Container(
              padding: EdgeInsets.only(top: 0.h, right: 20),
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(Assets.brillianceEffect),
                    fit: BoxFit.cover,
                    opacity: 0.2),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff5373E0), Color(0xff7C9EE9)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.family_restroom_rounded,
                      color: Colors.white, size: 40.sp),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "الإشتراك",
                    style: AppTextStyles.jannat18BoldWhite.copyWith(
                      color: Colors.white,
                      fontSize: 25.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "في التأمين الصحي",
                    style: AppTextStyles.jannat18BoldWhite.copyWith(
                      color: Colors.white,
                      fontSize: 25.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 140.w,
            bottom: 5.h,
            child: SizedBox(
              height: 220.h,
              width: 220.w,
              child: Image.asset(Assets.threeDDimage),
            ),
          ),
        ],
      ),
    );
  }
}
