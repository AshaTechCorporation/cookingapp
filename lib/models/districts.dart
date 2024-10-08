import 'package:cookingapp/models/provinecs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'districts.g.dart';

@JsonSerializable()
class Districts {
  final int? id;
  final String? name_th;
  final String? name_en;
  final int? province_id;
  final int? district_id;
  final String? zip_code;
  List<Provinecs>? sub_districts;

  Districts(
    this.id,
    this.name_th,
    this.name_en,
    this.province_id,
    this.district_id,
    this.zip_code,
    this.sub_districts,
  );

  factory Districts.fromJson(Map<String, dynamic> json) => _$DistrictsFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictsToJson(this);
}
