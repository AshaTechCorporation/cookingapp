import 'package:json_annotation/json_annotation.dart';

part 'provinecs.g.dart';

@JsonSerializable()
class Provinecs {
  final int? id;
  final String? name_th;
  final String? name_en;
  final int? province_id;
  final int? district_id;
  final String? zip_code;

  Provinecs(
    this.id,
    this.name_th,
    this.name_en,
    this.province_id,
    this.district_id,
    this.zip_code,
  );

  factory Provinecs.fromJson(Map<String, dynamic> json) => _$ProvinecsFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinecsToJson(this);
}
