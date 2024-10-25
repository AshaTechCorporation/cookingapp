// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menus _$MenusFromJson(Map<String, dynamic> json) => Menus(
      (json['id'] as num).toInt(),
      (json['available'] as num?)?.toInt(),
      json['description'] as String?,
      json['name'] as String?,
      json['price'] as String?,
      json['distance'] as String?,
      (json['restaurant_id'] as num).toInt(),
      json['photo'] as String?,
      json['photo_url'] as String?,
      json['restaurant'] == null ? null : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenusToJson(Menus instance) => <String, dynamic>{
      'id': instance.id,
      'restaurant_id': instance.restaurant_id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'distance': instance.distance,
      'available': instance.available,
      'photo': instance.photo,
      'photo_url': instance.photo_url,
      'restaurant': instance.restaurant,
    };
