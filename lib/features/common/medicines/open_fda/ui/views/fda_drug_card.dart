import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/data_wide_shape.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/common/medicines/open_fda/data/models/drug_result.dart';

class FdaDrugCard extends StatelessWidget {
  const FdaDrugCard({super.key, required this.drugResult});
  final OpenFdaDrugLabel? drugResult;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          isScrollControlled: true,
          builder: (context) {
            return FdaDrugSheetContent(drug: drugResult);
          },
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 18.h),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          getDrugName(drugResult),
                          style: AppTextStyles.jannat18LightBlue.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.onSurface),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  getDrugName(OpenFdaDrugLabel? drug) {
    if (drug?.openFdaDrugData?.brandName != null) {
      return drug?.openFdaDrugData?.brandName!.first;
    } else if (drug?.openFdaDrugData?.genericName != null) {
      return drug?.openFdaDrugData?.genericName!.first;
    } else {
      return "لا يوجد اسم";
    }
  }
}

class FdaDrugSheetContent extends StatelessWidget {
  const FdaDrugSheetContent({super.key, required this.drug});
  final OpenFdaDrugLabel? drug;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      width: context.width,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          verticleSpace(10),
          AppThemeing.dragHandle(context),
          verticleSpace(15),
          Expanded(
              child: ListView(
            children: [
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.brandName, "اسم الدواء"),
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.genericName, "الاسم العلمي"),
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.manufacturerName, "الشركة المصنعة"),
              _buildInfromationWidget(drug?.openFdaDrugData?.route, "الطريقة"),
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.substanceName, "المادة الفعالة"),
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.productNdc, "الرقم الوطني للدواء"),
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.productType, "نوع الدواء"),
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.unii, "الرمز الدولي للمادة"),
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.rxcui, "الرمز الدولي للدواء"),
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.splSetId, "الرقم المعرف للدواء"),
              _buildInfromationWidget(
                  drug?.openFdaDrugData?.splId, "الرقم المعرف للدواء"),
              _buildInfromationWidget(drug?.activeIngredient, "المادة الفعالة"),
              _buildInfromationWidget(drug?.description, "الوصف"),
              _buildInfromationWidget(
                  drug?.adverseReactions, "التفاعلات الجانبية"),
              _buildInfromationWidget(drug?.warnings, "التحذيرات"),
              _buildInfromationWidget(drug?.indicationsAndUsage, "الاستخدامات"),
              _buildInfromationWidget(
                  drug?.dosageAndAdministration, "الجرعة والإدارة"),
              _buildInfromationWidget(drug?.geriatricUse, "استخدام كبار السن"),
              _buildInfromationWidget(drug?.pediatricUse, "استخدام الأطفال"),
              _buildInfromationWidget(drug?.howSupplied, "الحمل والرضاعة"),
              _buildInfromationWidget(
                  drug?.storageAndHandling, "التخزين والتعامل"),
              _buildInfromationWidget(drug?.pregnancy, "الحمل"),
              _buildInfromationWidget(drug?.nursingMothers, "الرضاعة"),
              _buildInfromationWidget(
                  drug?.clinicalPharmacology, "الصيدلة السريرية"),
              _buildInfromationWidget(drug?.mechanismOfAction, "آلية العمل"),
              _buildInfromationWidget(
                  drug?.drugInteractions, "التفاعلات الدوائية"),
              _buildInfromationWidget(drug?.overdosage, "الجرعة الزائدة"),
              _buildInfromationWidget(
                  drug?.clinicalStudies, "الدراسات السريرية"),
              _buildInfromationWidget(drug?.boxedWarning, "تحذير مربع"),
              _buildInfromationWidget(drug?.pharmacokinetics, "الصيدلانيات"),
              _buildInfromationWidget(
                  drug?.generalPrecautions, "الاحتياطات العامة"),
              _buildInfromationWidget(drug?.contraindications, "التضادات"),
              _buildInfromationWidget(drug?.precautions, "الاحتياطات"),
              _buildInfromationWidget(drug?.animalPharmacologyAndOrToxicology,
                  "الصيدلانيات الحيوانية و/أو السمية"),
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildInfromationWidget(List<String?>? field, String title) {
    if (field != null) {
      return DataWideShape(
        title: title,
        value: field.first ?? "لا يوجد معلومات",
      );
    } else {
      return Container();
    }
  }
}
