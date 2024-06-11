import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/custom_hospital_appbar.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/helper/app_assets.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/patient/firebase_hospitals/data/models/firebase_hospital_model.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/widgets/fax_number_widget.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/widgets/phone_number_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class FirebaseHospitalProfileView extends StatelessWidget {
  const FirebaseHospitalProfileView({super.key, required this.hospital});
  final FireBaseHospitalsModel hospital;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHospitalAppBar(
            gradient: AppThemeing.patientGradient,
            hospitalImage: Assets.hospitalView,
            isMainProfile: false,
          ),
          verticleSpace(20),
          Text(
            hospital.name ?? "",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.jannat18BoldWhite.copyWith(
                color: context.theme.colorScheme.onSurface,
                fontSize: 16.sp,
                letterSpacing: 1),
          ),
          verticleSpace(6),
          Divider(
            color: context.theme.colorScheme.onSurface,
            thickness: 0.5,
            indent: 20.w,
            endIndent: 20.w,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                verticleSpace(20),
                DataWideShape(title: "العنوان", value: "${hospital.address}"),
                HospitalGoogleMap(
                  onTap: () {
                    openGoogleMaps(hospital.location!);
                  },
                ),
                verticleSpace(10),
                handlePhoneNumber(hospital.phone1),
                verticleSpace(10),
                handlePhoneNumber(hospital.phone2),
                verticleSpace(10),
                handleFax(hospital.fax),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget handlePhoneNumber(String? number) {
    if (number.isNullOrEmpty()) {
      return const SizedBox.shrink();
    } else {
      return PhoneNumber(
        onPressed: callTheHospital,
        phoneNumber: number!,
      );
    }
  }

  callTheHospital() async {
    await FlutterPhoneDirectCaller.callNumber(hospital.phone1!);
  }

  Widget handleFax(String? fax) {
    if (fax.isNullOrEmpty()) {
      return const SizedBox.shrink();
    } else {
      return FaxNumber(
        faxNumber: fax!,
      );
    }
  }

  void openGoogleMaps(String location) async {
    String locationUrl = location;
    Uri uri = Uri.parse(locationUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      log('Could not launch $locationUrl');
    }
  }
}

class HospitalGoogleMap extends StatelessWidget {
  const HospitalGoogleMap({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        splashColor: AppColors.deepBlue,
        child: Container(
          height: 130.h,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 15,
                ),
              ],
              gradient: const LinearGradient(colors: [
                //generate 3 different green colors
                Color(0xff065ef2),
                Color(0xff419fff),
              ]),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 4.w,
                color: const Color(0xff065ef2),
              ),
              image: const DecorationImage(
                  image: AssetImage(Assets.googleMapImage),
                  fit: BoxFit.cover,
                  opacity: 0.4)),
          child: Text(
            "الموقع على الخريطة",
            style: AppTextStyles.jannat18ExtraBoldWhite.copyWith(
              color: Colors.white,
              fontSize: 26.sp,
              //make a shadow for text
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
