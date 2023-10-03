// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tilequery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tilequery _$TilequeryFromJson(Map<String, dynamic> json) => Tilequery(
      type: json['type'] as String?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TilequeryToJson(Tilequery instance) => <String, dynamic>{
      'type': instance.type,
      'features': instance.features,
    };

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      type: json['type'] as String?,
      id: json['id'] as int?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'geometry': instance.geometry,
      'properties': instance.properties,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      categoryZhHans: json['category_zh-Hans'] as String?,
      type: json['type'] as String?,
      filterrank: json['filterrank'] as int?,
      categoryEn: json['category_en'] as String?,
      sizerank: json['sizerank'] as int?,
      iso31661: json['iso_3166_1'] as String?,
      maki: json['maki'] as String?,
      nameScript: json['name_script'] as String?,
      iso31662: json['iso_3166_2'] as String?,
      propertiesClass: json['class'] as String?,
      name: json['name'] as String?,
      tilequery: json['tilequery'] == null
          ? null
          : TilequeryClass.fromJson(json['tilequery'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'category_zh-Hans': instance.categoryZhHans,
      'type': instance.type,
      'filterrank': instance.filterrank,
      'category_en': instance.categoryEn,
      'sizerank': instance.sizerank,
      'iso_3166_1': instance.iso31661,
      'maki': instance.maki,
      'name_script': instance.nameScript,
      'iso_3166_2': instance.iso31662,
      'class': instance.propertiesClass,
      'name': instance.name,
      'tilequery': instance.tilequery,
    };

TilequeryClass _$TilequeryClassFromJson(Map<String, dynamic> json) =>
    TilequeryClass(
      distance: (json['distance'] as num?)?.toDouble(),
      geometry: json['geometry'] as String?,
      layer: json['layer'] as String?,
    );

Map<String, dynamic> _$TilequeryClassToJson(TilequeryClass instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'geometry': instance.geometry,
      'layer': instance.layer,
    };
