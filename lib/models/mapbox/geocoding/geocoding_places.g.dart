// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_places.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingPlaces _$GeocodingPlacesFromJson(Map<String, dynamic> json) =>
    GeocodingPlaces(
      type: json['type'] as String?,
      query:
          (json['query'] as List<dynamic>?)?.map((e) => e as String).toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => _$FeatureFromJson(e as Map<String, dynamic>))
          .toList(),
      attribution: json['attribution'] as String?,
    );

Map<String, dynamic> _$GeocodingPlacesToJson(GeocodingPlaces instance) =>
    <String, dynamic>{
      'type': instance.type,
      'query': instance.query,
      'features': instance.features,
      'attribution': instance.attribution,
    };

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      id: json['id'] as String?,
      type: json['type'] as String?,
      placeType: (json['place_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      relevance: json['relevance'] as num?,
      properties: json['properties'] == null
          ? null
          : _$PropertiesFromJson(json['properties'] as Map<String, dynamic>),
      text: json['text'] as String?,
      placeName: json['place_name'] as String?,
      center: (json['center'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      geometry: json['geometry'] == null
          ? null
          : _$GeometryFromJson(json['geometry'] as Map<String, dynamic>),
      context: (json['context'] as List<dynamic>?)
          ?.map((e) => _$ContextFromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'placeType': instance.placeType,
      'relevance': instance.relevance,
      'properties': instance.properties,
      'text': instance.text,
      'placeName': instance.placeName,
      'center': instance.center,
      'geometry': instance.geometry,
      'context': instance.context,
    };

Context _$ContextFromJson(Map<String, dynamic> json) => Context(
      id: json['id'] as String?,
      mapboxId: json['mapbox_id'] as String?,
      text: json['text'] as String?,
      wikidata: json['wikidata'] as String?,
      shortCode: json['short_code'] as String?,
    );

Map<String, dynamic> _$ContextToJson(Context instance) => <String, dynamic>{
      'id': instance.id,
      'mapboxId': instance.mapboxId,
      'text': instance.text,
      'wikidata': instance.wikidata,
      'shortCode': instance.shortCode,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'coordinates': instance.coordinates,
      'type': instance.type,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      foursquare: json['foursquare'] as String?,
      landmark: json['landmark'] as bool?,
      address: json['address'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'foursquare': instance.foursquare,
      'landmark': instance.landmark,
      'address': instance.address,
      'category': instance.category,
    };
