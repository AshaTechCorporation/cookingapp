import 'package:cookingapp/models/menus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  final int id;
  final int user_id;
  final String? name;
  final String? address;
  final String? description;
  final int? province_id;
  final int? district_id;
  final String? latitude;
  final String? longitude;
  final String? open_hours;
  final String? status;
  List<Menus>? menus;

  Restaurant(this.id, this.name, this.user_id, this.address, this.description, this.district_id, this.latitude, this.longitude, this.open_hours, this.province_id, this.status);

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
