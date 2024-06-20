import 'package:flutter/material.dart';
import 'package:mhi/config/router/routes.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/common/records/presentation/views/patient_records_view.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/profile/doctor_booking_profile_appbar.dart';

class PatientBookingProfile extends StatelessWidget {
  const PatientBookingProfile({super.key, required this.model});
  final DoctorAppointementModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const UserProfileBar(),
          Text(model.patientId?.name ?? "غير معرف",
              style: AppTextStyles.jannat21BoldOnSurface(context)),
          verticleSpace(10),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DataWideShape(
                    title: "تاريخ الميلاد",
                    value:
                        model.patientId!.birthday?.formattedDate ?? "غير معرف"),
                DataWideShape(
                    title: "كود المريض",
                    value: model.patientId?.code ?? "غير معرف"),
                verticleSpace(10),
                OptionButton(
                    icon: Icons.pending_actions_sharp,
                    value: "التقارير الطبية للمريض",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PatientRecordView(patientId: model.patientId!.id!),
                      ));
                    }),
                verticleSpace(13),
                OptionButton(
                    icon: Icons.pending_actions_sharp,
                    value: "إنشاء تقرير جديد",
                    onTap: () {
                      context.navigateTo(Routes.createNewRecordView,
                          arguments: model);
                    }),
                verticleSpace(13),
                OptionButton(
                    icon: Icons.pending_actions_sharp,
                    value: "طلب عملية جديدة",
                    onTap: () {
                      context.navigateTo(Routes.requestNewSurgeryView,
                          arguments: model);
                    }),

              ],
            ),
          )
        ],
      ),
    );
  }
}
