// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugResult _$DrugResultFromJson(Map<String, dynamic> json) => DrugResult(
      drugs: (json['results'] as List<dynamic>?)
          ?.map((e) => OpenFdaDrugLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrugResultToJson(DrugResult instance) =>
    <String, dynamic>{
      'results': instance.drugs,
    };

OpenFdaDrugLabel _$OpenFdaDrugLabelFromJson(Map<String, dynamic> json) =>
    OpenFdaDrugLabel(
      indicationsAndUsage: (json['indications_and_usage'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dosageAndAdministration:
          (json['dosage_and_administration'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      warnings: (json['warnings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      storageAndHandling: (json['storage_and_handling'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pregnancy: (json['pregnancy_or_breast_feeding'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nursingMothers: (json['nursing_mothers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      clinicalPharmacology: (json['clinical_pharmacology'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mechanismOfAction: (json['mechanism_of_action'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      howSupplied: (json['how_supplied'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      activeIngredient: (json['active_ingredient'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      inactiveIngredient: (json['inactive_ingredient'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      adverseReactions: (json['adverse_reactions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      drugInteractions: (json['drug_interactions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      overdosage: (json['overdosage'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      clinicalStudies: (json['clinical_studies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      boxedWarning: (json['boxed_warning'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pharmacokinetics: (json['pharmacokinetics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      generalPrecautions: (json['general_precautions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      contraindications: (json['contraindications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      precautions: (json['precautions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pediatricUse: (json['pediatric_use'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      geriatricUse: (json['geriatric_use'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      animalPharmacologyAndOrToxicology:
          (json['animal_pharmacology_and_or_toxicology'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      openFdaDrugData: json['openfda'] == null
          ? null
          : OpenFdaDrugData.fromJson(json['openfda'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenFdaDrugLabelToJson(OpenFdaDrugLabel instance) =>
    <String, dynamic>{
      'indications_and_usage': instance.indicationsAndUsage,
      'dosage_and_administration': instance.dosageAndAdministration,
      'warnings': instance.warnings,
      'storage_and_handling': instance.storageAndHandling,
      'pregnancy_or_breast_feeding': instance.pregnancy,
      'nursing_mothers': instance.nursingMothers,
      'clinical_pharmacology': instance.clinicalPharmacology,
      'mechanism_of_action': instance.mechanismOfAction,
      'how_supplied': instance.howSupplied,
      'description': instance.description,
      'active_ingredient': instance.activeIngredient,
      'inactive_ingredient': instance.inactiveIngredient,
      'adverse_reactions': instance.adverseReactions,
      'drug_interactions': instance.drugInteractions,
      'overdosage': instance.overdosage,
      'clinical_studies': instance.clinicalStudies,
      'boxed_warning': instance.boxedWarning,
      'pharmacokinetics': instance.pharmacokinetics,
      'general_precautions': instance.generalPrecautions,
      'contraindications': instance.contraindications,
      'precautions': instance.precautions,
      'pediatric_use': instance.pediatricUse,
      'geriatric_use': instance.geriatricUse,
      'animal_pharmacology_and_or_toxicology':
          instance.animalPharmacologyAndOrToxicology,
      'openfda': instance.openFdaDrugData,
    };

OpenFdaDrugData _$OpenFdaDrugDataFromJson(Map<String, dynamic> json) =>
    OpenFdaDrugData(
      applicationNumber: (json['application_number'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      brandName: (json['brand_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      genericName: (json['generic_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      manufacturerName: (json['manufacturer_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productNdc: (json['product_ndc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productType: (json['product_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      route:
          (json['route'] as List<dynamic>?)?.map((e) => e as String).toList(),
      substanceName: (json['substance_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rxcui:
          (json['rxcui'] as List<dynamic>?)?.map((e) => e as String).toList(),
      splId:
          (json['spl_id'] as List<dynamic>?)?.map((e) => e as String).toList(),
      splSetId: (json['spl_set_id'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      packageNdc: (json['package_ndc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      unii: (json['unii'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OpenFdaDrugDataToJson(OpenFdaDrugData instance) =>
    <String, dynamic>{
      'application_number': instance.applicationNumber,
      'brand_name': instance.brandName,
      'generic_name': instance.genericName,
      'manufacturer_name': instance.manufacturerName,
      'product_ndc': instance.productNdc,
      'product_type': instance.productType,
      'route': instance.route,
      'substance_name': instance.substanceName,
      'rxcui': instance.rxcui,
      'spl_id': instance.splId,
      'spl_set_id': instance.splSetId,
      'package_ndc': instance.packageNdc,
      'unii': instance.unii,
    };
