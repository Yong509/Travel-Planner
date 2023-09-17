import 'package:json_annotation/json_annotation.dart';

part 'geocoding_places.g.dart';

@JsonSerializable()
class GeocodingPlaces {
  String? type;
  List<String>? query;
  List<Feature>? features;
  String? attribution;

  GeocodingPlaces({
    this.type,
    this.query,
    this.features,
    this.attribution,
  });

  factory GeocodingPlaces.fromJson(Map<String, dynamic> json) =>
      _$GeocodingPlacesFromJson(json);
}

@JsonSerializable()
class Feature {
  String? id;
  String? type;
  List<String>? placeType;
  num? relevance;
  Properties? properties;
  String? text;
  String? placeName;
  List<double>? center;
  Geometry? geometry;
  List<Context>? context;

  Feature({
    this.id,
    this.type,
    this.placeType,
    this.relevance,
    this.properties,
    this.text,
    this.placeName,
    this.center,
    this.geometry,
    this.context,
  });
}

@JsonSerializable()
class Context {
  String? id;
  String? mapboxId;
  String? text;
  String? wikidata;
  String? shortCode;

  Context({
    this.id,
    this.mapboxId,
    this.text,
    this.wikidata,
    this.shortCode,
  });
}

@JsonSerializable()
class Geometry {
  List<double>? coordinates;
  String? type;

  Geometry({
    this.coordinates,
    this.type,
  });
}

@JsonSerializable()
class Properties {
  String? foursquare;
  bool? landmark;
  String? address;
  String? category;

  Properties({
    this.foursquare,
    this.landmark,
    this.address,
    this.category,
  });
}
