import 'package:json_annotation/json_annotation.dart';

part 'menus.g.dart';

@JsonSerializable()
class Menus {
  final int id;
  final int restaurant_id;
  final String? name;
  final String? description;
  final String? price;
  final int? available;

  Menus(this.id, this.available, this.description, this.name, this.price, this.restaurant_id);
  factory Menus.fromJson(Map<String, dynamic> json) => _$MenusFromJson(json);

  Map<String, dynamic> toJson() => _$MenusToJson(this);
}
