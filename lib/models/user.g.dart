// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      (json['id'] as num?)?.toInt(),
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['phone_number'] as String?,
      json['birth_date'] as String?,
      json['gender'] as String?,
      json['username'] as String?,
      json['user_type'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
      'birth_date': instance.birth_date,
      'gender': instance.gender,
      'username': instance.username,
      'user_type': instance.user_type,
    };
