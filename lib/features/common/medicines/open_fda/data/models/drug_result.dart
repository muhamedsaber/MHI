import 'package:json_annotation/json_annotation.dart';

part 'drug_result.g.dart';

@JsonSerializable()
class DrugResult {
  @JsonKey(name: 'results')
  List<OpenFdaDrugLabel>? drugs;
  DrugResult({this.drugs});

  factory DrugResult.fromJson(Map<String, dynamic> json) =>
      _$DrugResultFromJson(json);

  Map<String, dynamic> toJson() => _$DrugResultToJson(this);
}

@JsonSerializable()
class OpenFdaDrugLabel {
  @JsonKey(name: 'indications_and_usage')
  List<String>? indicationsAndUsage;

  @JsonKey(name: 'dosage_and_administration')
  List<String>? dosageAndAdministration;

  @JsonKey(name: 'warnings')
  List<String>? warnings;

  @JsonKey(name: 'storage_and_handling')
  List<String>? storageAndHandling;

  @JsonKey(name: 'pregnancy_or_breast_feeding')
  List<String>? pregnancy;

  @JsonKey(name: 'nursing_mothers')
  List<String>? nursingMothers;

  @JsonKey(name: 'clinical_pharmacology')
  List<String>? clinicalPharmacology;

  @JsonKey(name: 'mechanism_of_action')
  List<String>? mechanismOfAction;

  @JsonKey(name: 'how_supplied')
  List<String>? howSupplied;

  @JsonKey(name: 'description')
  List<String>? description;

  @JsonKey(name: 'active_ingredient')
  List<String>? activeIngredient;
  @JsonKey(name: 'inactive_ingredient')
  List<String>? inactiveIngredient;

  @JsonKey(name: 'adverse_reactions')
  List<String>? adverseReactions;

  @JsonKey(name: 'drug_interactions')
  List<String>? drugInteractions;

  @JsonKey(name: 'overdosage')
  List<String>? overdosage;

  @JsonKey(name: 'clinical_studies')
  List<String>? clinicalStudies;

  @JsonKey(name: 'boxed_warning')
  List<String>? boxedWarning;

  @JsonKey(name: 'pharmacokinetics')
  List<String>? pharmacokinetics;

  @JsonKey(name: 'general_precautions')
  List<String>? generalPrecautions;

  @JsonKey(name: 'contraindications')
  List<String>? contraindications;

  @JsonKey(name: 'precautions')
  List<String>? precautions;

  @JsonKey(name: 'pediatric_use')
  List<String>? pediatricUse;

  @JsonKey(name: 'geriatric_use')
  List<String>? geriatricUse;

  @JsonKey(name: 'animal_pharmacology_and_or_toxicology')
  List<String>? animalPharmacologyAndOrToxicology;
  @JsonKey(name: 'openfda')
  OpenFdaDrugData? openFdaDrugData;



  /// lets create a constructor for this class

  OpenFdaDrugLabel({
    this.indicationsAndUsage,
    this.dosageAndAdministration,
    this.warnings,
    this.storageAndHandling,
    this.pregnancy,
    this.nursingMothers,
    this.clinicalPharmacology,
    this.mechanismOfAction,
    this.howSupplied,
    this.description,
    this.activeIngredient,
    this.inactiveIngredient,
    this.adverseReactions,
    this.drugInteractions,
    this.overdosage,
    this.clinicalStudies,
    this.boxedWarning,
    this.pharmacokinetics,
    this.generalPrecautions,
    this.contraindications,
    this.precautions,
    this.pediatricUse,
    this.geriatricUse,
    this.animalPharmacologyAndOrToxicology,
    this.openFdaDrugData
  });

  /// lets create a factory method to create a DrugLabel object from a json object

  factory OpenFdaDrugLabel.fromJson(Map<String, dynamic> json) =>
      _$OpenFdaDrugLabelFromJson(json);

  /// lets create a method to convert a DrugLabel object to a json object

  Map<String, dynamic> toJson() => _$OpenFdaDrugLabelToJson(this);
}
@JsonSerializable()
class OpenFdaDrugData{
  @JsonKey(name: 'application_number')
   List<String>? applicationNumber;
  @JsonKey(name: 'brand_name')
 List<String>? brandName;
  @JsonKey(name: 'generic_name')
  List<String>? genericName;
  @JsonKey(name: 'manufacturer_name')

  List<String>? manufacturerName;
  @JsonKey(name: 'product_ndc')
  List<String>? productNdc;
  @JsonKey(name: 'product_type')
  List<String>? productType;
  @JsonKey(name: 'route')
  List<String>? route;
  @JsonKey(name: 'substance_name')
  List<String>? substanceName;
  @JsonKey(name: 'rxcui')
  List<String>?rxcui;
  @JsonKey(name: 'spl_id')

  List<String>? splId;
  @JsonKey(name: 'spl_set_id')
  List<String>? splSetId;
  @JsonKey(name: 'package_ndc')

 List<String>? packageNdc;
 
  @JsonKey(name: 'unii')
  List<String>? unii;

  OpenFdaDrugData({
    this.applicationNumber,
    this.brandName,
    this.genericName,
    this.manufacturerName,
    this.productNdc,
    this.productType,
    this.route,
    this.substanceName,
    this.rxcui,
    this.splId,
    this.splSetId,
    this.packageNdc,
   
    this.unii,
  });

  factory OpenFdaDrugData.fromJson(Map<String, dynamic> json) =>
      _$OpenFdaDrugDataFromJson(json);

  Map<String, dynamic> toJson() => _$OpenFdaDrugDataToJson(this);
}