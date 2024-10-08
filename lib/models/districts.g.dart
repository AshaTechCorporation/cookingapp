// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'districts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Districts _$DistrictsFromJson(Map<String, dynamic> json) => Districts(
      (json['id'] as num?)?.toInt(),
      json['name_th'] as String?,
      json['name_en'] as String?,
      (json['province_id'] as num?)?.toInt(),
      (json['district_id'] as num?)?.toInt(),
      json['zip_code'] as String?,
      (json['districts'] as List<dynamic>?)?.map((e) => Provinecs.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$DistrictsToJson(Districts instance) => <String, dynamic>{
      'id': instance.id,
      'name_th': instance.name_th,
      'name_en': instance.name_en,
      'province_id': instance.province_id,
      'district_id': instance.district_id,
      'zip_code': instance.zip_code,
      'districts': instance.sub_districts,
    };
