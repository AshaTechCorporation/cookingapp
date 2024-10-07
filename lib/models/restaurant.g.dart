// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      (json['id'] as num).toInt(),
      json['name'] as String?,
      (json['user_id'] as num).toInt(),
      json['address'] as String?,
      json['description'] as String?,
      (json['district_id'] as num?)?.toInt(),
      json['latitude'] as String?,
      json['longitude'] as String?,
      json['open_hours'] as String?,
      (json['province_id'] as num?)?.toInt(),
      json['status'] as String?,
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'province_id': instance.province_id,
      'district_id': instance.district_id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'open_hours': instance.open_hours,
      'status': instance.status,
    };
