import 'package:json_annotation/json_annotation.dart';

part 'mhi_medicine_model.g.dart';

@JsonSerializable()
class MhiMedicineModel {
  @JsonKey(name: "findMedicines")
  final List<MhiMedicineData> medicineData;
  MhiMedicineModel({
    required this.medicineData,
  });
  factory MhiMedicineModel.fromJson(Map<String, dynamic> json) =>
      _$MhiMedicineModelFromJson(json);
  Map<String, dynamic> toJson() => _$MhiMedicineModelToJson(this);
}

@JsonSerializable()
class MhiMedicineData {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;

  final String? description;
  final String? howToUse;
  final String? components;
  final String? tradeMark;
  MhiMedicineData({
    required this.id,
    required this.name,
    required this.description,
    required this.howToUse,
    required this.components,
    required this.tradeMark,
  });
  factory MhiMedicineData.fromJson(Map<String, dynamic> json) =>
      _$MhiMedicineDataFromJson(json);
  Map<String, dynamic> toJson() => _$MhiMedicineDataToJson(this);
}
