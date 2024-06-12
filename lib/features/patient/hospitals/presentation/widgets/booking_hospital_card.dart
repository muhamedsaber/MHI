import 'package:flutter/material.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/hospitals/data/models/booking_hospital_model.dart';

class BookingHospitalCard extends StatelessWidget {
  const BookingHospitalCard({
    super.key,
    required this.hospitalModel,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap
  });

  final BookingHospitalModel hospitalModel;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.94,
    
      child: GestureDetector(
        onTap: onTap
         
        ,
        child: Card(
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(hospitalModel.name ?? "غير معروف",
                      style: AppTextStyles.jannat18BoldWhite.copyWith(
                          fontSize: 24.0,
                          color:textColor)),
                ),
                 verticleSpace(8),
                Flexible(
                  child: Text(hospitalModel.address ?? "غير معروف",
                      style: AppTextStyles.jannat18BoldWhite.copyWith(
                          fontSize: 17.0,
                          color:textColor)),
                ),
               verticleSpace(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
