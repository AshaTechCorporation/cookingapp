import 'package:cookingapp/models/restaurant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menus.g.dart';

@JsonSerializable()
class Menus {
  final int id;
  final int restaurant_id;
  final String? name;
  final String? description;
  final String? price;
  final String? distance;
  final int? available;
  final String? photo;
  final String? photo_url;
  final Restaurant? restaurant;

  Menus(
    this.id,
    this.available,
    this.description,
    this.name,
    this.price,
    this.distance,
    this.restaurant_id,
    this.photo,
    this.photo_url,
    this.restaurant,
  );
  factory Menus.fromJson(Map<String, dynamic> json) => _$MenusFromJson(json);

  Map<String, dynamic> toJson() => _$MenusToJson(this);
}
