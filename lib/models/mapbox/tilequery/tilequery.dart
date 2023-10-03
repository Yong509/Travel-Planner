import 'package:json_annotation/json_annotation.dart';

part 'tilequery.g.dart';

@JsonSerializable()
class Tilequery {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "features")
  List<Feature>? features;

  Tilequery({
    this.type,
    this.features,
  });

  factory Tilequery.fromJson(Map<String, dynamic> json) =>
      _$TilequeryFromJson(json);

  Map<String, dynamic> toJson() => _$TilequeryToJson(this);
}

@JsonSerializable()
class Feature {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "geometry")
  Geometry? geometry;
  @JsonKey(name: "properties")
  Properties? properties;

  Feature({
    this.type,
    this.id,
    this.geometry,
    this.properties,
  });

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}

@JsonSerializable()
class Geometry {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "coordinates")
  List<double>? coordinates;

  Geometry({
    this.type,
    this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Properties {
  @JsonKey(name: "category_zh-Hans")
  String? categoryZhHans;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "filterrank")
  int? filterrank;
  @JsonKey(name: "category_en")
  String? categoryEn;
  @JsonKey(name: "sizerank")
  int? sizerank;
  @JsonKey(name: "iso_3166_1")
  String? iso31661;
  @JsonKey(name: "maki")
  String? maki;
  @JsonKey(name: "name_script")
  String? nameScript;
  @JsonKey(name: "iso_3166_2")
  String? iso31662;
  @JsonKey(name: "class")
  String? propertiesClass;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "tilequery")
  TilequeryClass? tilequery;

  Properties({
    this.categoryZhHans,
    this.type,
    this.filterrank,
    this.categoryEn,
    this.sizerank,
    this.iso31661,
    this.maki,
    this.nameScript,
    this.iso31662,
    this.propertiesClass,
    this.name,
    this.tilequery,
  });

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class TilequeryClass {
  @JsonKey(name: "distance")
  double? distance;
  @JsonKey(name: "geometry")
  String? geometry;
  @JsonKey(name: "layer")
  String? layer;

  TilequeryClass({
    this.distance,
    this.geometry,
    this.layer,
  });

  factory TilequeryClass.fromJson(Map<String, dynamic> json) =>
      _$TilequeryClassFromJson(json);

  Map<String, dynamic> toJson() => _$TilequeryClassToJson(this);
}
