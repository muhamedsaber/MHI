import 'package:flutter/material.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/data/models/booking_hospital_model.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/presentation/widgets/hospitals/hospital_data_sheet_body.dart';

class BookingHospitalCard extends StatelessWidget {
  const BookingHospitalCard(
      {super.key,
      required this.hospitalModel,
      required this.backgroundColor,
      required this.textColor,
      required this.onTap});

  final BookingHospitalModel hospitalModel;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      child: GestureDetector(
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return HospitalsDataSheetBody(hospitalModel: hospitalModel);
            },
          );
        },
        onTap: onTap,
        child: Card(
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(hospitalModel.name ?? "غير معروف",
                      textAlign: TextAlign.right,
                      style: AppTextStyles.jannat18BoldWhite
                          .copyWith(fontSize: 24.0, color: textColor)),
                ),
                verticleSpace(14),
                Row(
                  children: [
                    Expanded(
                      child: Text(hospitalModel.address ?? "غير معروف",
                          textAlign: TextAlign.right,
                          style: AppTextStyles.jannat18BoldWhite
                              .copyWith(fontSize: 17.0, color: textColor)),
                    ),
                    horizontalSpace(10),
                    Icon(
                      Icons.location_on,
                      color: textColor,
                    ),
                  ],
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
