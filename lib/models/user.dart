import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int? id;
  final String? first_name;
  final String? last_name;
  final String? phone_number;
  final String? birth_date;
  final String? gender;
  final String? username;
  final String? user_type;

  User(
    this.id,
    this.first_name,
    this.last_name,
    this.phone_number,
    this.birth_date,
    this.gender,
    this.username,
    this.user_type,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
