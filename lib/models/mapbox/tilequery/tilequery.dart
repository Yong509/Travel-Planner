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
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "structure")
  String? structure;
  @JsonKey(name: "oneway")
  String? oneway;
  @JsonKey(name: "iso_3166_2")
  String? iso31662;
  @JsonKey(name: "len")
  int? len;
  @JsonKey(name: "iso_3166_1")
  String? iso31661;
  @JsonKey(name: "class")
  String? propertiesClass;
  @JsonKey(name: "tilequery")
  TilequeryClass? tilequery;
  @JsonKey(name: "underground")
  String? underground;
  @JsonKey(name: "extrude")
  String? extrude;
  @JsonKey(name: "height")
  int? height;
  @JsonKey(name: "min_height")
  int? minHeight;

  Properties({
    this.type,
    this.structure,
    this.oneway,
    this.iso31662,
    this.len,
    this.iso31661,
    this.propertiesClass,
    this.tilequery,
    this.underground,
    this.extrude,
    this.height,
    this.minHeight,
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
