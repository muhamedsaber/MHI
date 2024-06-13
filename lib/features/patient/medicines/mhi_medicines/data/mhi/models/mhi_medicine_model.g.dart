// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mhi_medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MhiMedicineModel _$MhiMedicineModelFromJson(Map<String, dynamic> json) =>
    MhiMedicineModel(
      medicineData: (json['findMedicines'] as List<dynamic>)
          .map((e) => MhiMedicineData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MhiMedicineModelToJson(MhiMedicineModel instance) =>
    <String, dynamic>{
      'findMedicines': instance.medicineData,
    };

MhiMedicineData _$MhiMedicineDataFromJson(Map<String, dynamic> json) =>
    MhiMedicineData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      howToUse: json['howToUse'] as String?,
      components: json['components'] as String?,
      tradeMark: json['tradeMark'] as String?,
    );

Map<String, dynamic> _$MhiMedicineDataToJson(MhiMedicineData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'howToUse': instance.howToUse,
      'components': instance.components,
      'tradeMark': instance.tradeMark,
    };
