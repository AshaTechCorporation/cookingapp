// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinecs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provinecs _$ProvinecsFromJson(Map<String, dynamic> json) => Provinecs(
      (json['id'] as num?)?.toInt(),
      json['name_th'] as String?,
      json['name_en'] as String?,
      (json['province_id'] as num?)?.toInt(),
      (json['district_id'] as num?)?.toInt(),
      json['zip_code'] as String?,
    );

Map<String, dynamic> _$ProvinecsToJson(Provinecs instance) => <String, dynamic>{
      'id': instance.id,
      'name_th': instance.name_th,
      'name_en': instance.name_en,
      'province_id': instance.province_id,
      'district_id': instance.district_id,
      'zip_code': instance.zip_code,
    };
