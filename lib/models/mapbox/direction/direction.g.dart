// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Direction _$DirectionFromJson(Map<String, dynamic> json) => Direction(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      waypoints: (json['waypoints'] as List<dynamic>?)
          ?.map((e) => Waypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$DirectionToJson(Direction instance) => <String, dynamic>{
      'routes': instance.routes,
      'waypoints': instance.waypoints,
      'code': instance.code,
      'uuid': instance.uuid,
    };

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      weightTypical: (json['weight_typical'] as num?)?.toDouble(),
      durationTypical: (json['duration_typical'] as num?)?.toDouble(),
      weightName: json['weight_name'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      legs: (json['legs'] as List<dynamic>?)
          ?.map((e) => Leg.fromJson(e as Map<String, dynamic>))
          .toList(),
      geometry: json['geometry'] as String?,
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'weight_typical': instance.weightTypical,
      'duration_typical': instance.durationTypical,
      'weight_name': instance.weightName,
      'weight': instance.weight,
      'duration': instance.duration,
      'distance': instance.distance,
      'legs': instance.legs,
      'geometry': instance.geometry,
    };

Leg _$LegFromJson(Map<String, dynamic> json) => Leg(
      viaWaypoints: json['via_waypoints'] as List<dynamic>?,
      admins: (json['admins'] as List<dynamic>?)
          ?.map((e) => Admin.fromJson(e as Map<String, dynamic>))
          .toList(),
      weightTypical: (json['weight_typical'] as num?)?.toDouble(),
      durationTypical: (json['duration_typical'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble(),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      distance: (json['distance'] as num?)?.toDouble(),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$LegToJson(Leg instance) => <String, dynamic>{
      'via_waypoints': instance.viaWaypoints,
      'admins': instance.admins,
      'weight_typical': instance.weightTypical,
      'duration_typical': instance.durationTypical,
      'weight': instance.weight,
      'duration': instance.duration,
      'steps': instance.steps,
      'distance': instance.distance,
      'summary': instance.summary,
    };

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      iso31661: json['iso_3166_1'] as String?,
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'iso_3166_1': instance.iso31661,
    };

Step _$StepFromJson(Map<String, dynamic> json) => Step(
      intersections: (json['intersections'] as List<dynamic>?)
          ?.map((e) => Intersection.fromJson(e as Map<String, dynamic>))
          .toList(),
      maneuver: json['maneuver'] == null
          ? null
          : Maneuver.fromJson(json['maneuver'] as Map<String, dynamic>),
      name: json['name'] as String?,
      weightTypical: (json['weight_typical'] as num?)?.toDouble(),
      durationTypical: (json['duration_typical'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      drivingSide: json['driving_side'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      mode: json['mode'] as String?,
      geometry: json['geometry'] as String?,
      ref: json['ref'] as String?,
      destinations: json['destinations'] as String?,
      exits: json['exits'] as String?,
    );

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'intersections': instance.intersections,
      'maneuver': instance.maneuver,
      'name': instance.name,
      'weight_typical': instance.weightTypical,
      'duration_typical': instance.durationTypical,
      'duration': instance.duration,
      'distance': instance.distance,
      'driving_side': instance.drivingSide,
      'weight': instance.weight,
      'mode': instance.mode,
      'geometry': instance.geometry,
      'ref': instance.ref,
      'destinations': instance.destinations,
      'exits': instance.exits,
    };

Intersection _$IntersectionFromJson(Map<String, dynamic> json) => Intersection(
      entry: (json['entry'] as List<dynamic>?)?.map((e) => e as bool).toList(),
      bearings:
          (json['bearings'] as List<dynamic>?)?.map((e) => e as int).toList(),
      duration: (json['duration'] as num?)?.toDouble(),
      mapboxStreetsV8: json['mapbox_streets_v8'] == null
          ? null
          : MapboxStreetsV8.fromJson(
              json['mapbox_streets_v8'] as Map<String, dynamic>),
      isUrban: json['is_urban'] as bool?,
      adminIndex: json['admin_index'] as int?,
      out: json['out'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      geometryIndex: json['geometry_index'] as int?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      intersectionIn: json['in'] as int?,
      turnWeight: (json['turn_weight'] as num?)?.toDouble(),
      turnDuration: (json['turn_duration'] as num?)?.toDouble(),
      lanes: (json['lanes'] as List<dynamic>?)
          ?.map((e) => Lane.fromJson(e as Map<String, dynamic>))
          .toList(),
      tollCollection: json['toll_collection'] == null
          ? null
          : TollCollection.fromJson(
              json['toll_collection'] as Map<String, dynamic>),
      classes:
          (json['classes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      trafficSignal: json['traffic_signal'] as bool?,
      railwayCrossing: json['railway_crossing'] as bool?,
    );

Map<String, dynamic> _$IntersectionToJson(Intersection instance) =>
    <String, dynamic>{
      'entry': instance.entry,
      'bearings': instance.bearings,
      'duration': instance.duration,
      'mapbox_streets_v8': instance.mapboxStreetsV8,
      'is_urban': instance.isUrban,
      'admin_index': instance.adminIndex,
      'out': instance.out,
      'weight': instance.weight,
      'geometry_index': instance.geometryIndex,
      'location': instance.location,
      'in': instance.intersectionIn,
      'turn_weight': instance.turnWeight,
      'turn_duration': instance.turnDuration,
      'lanes': instance.lanes,
      'toll_collection': instance.tollCollection,
      'classes': instance.classes,
      'traffic_signal': instance.trafficSignal,
      'railway_crossing': instance.railwayCrossing,
    };

Lane _$LaneFromJson(Map<String, dynamic> json) => Lane(
      indications: (json['indications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      valid: json['valid'] as bool?,
      active: json['active'] as bool?,
      validIndication: json['valid_indication'] as String?,
    );

Map<String, dynamic> _$LaneToJson(Lane instance) => <String, dynamic>{
      'indications': instance.indications,
      'valid': instance.valid,
      'active': instance.active,
      'valid_indication': instance.validIndication,
    };

MapboxStreetsV8 _$MapboxStreetsV8FromJson(Map<String, dynamic> json) =>
    MapboxStreetsV8(
      mapboxStreetsV8Class: json['class'] as String?,
    );

Map<String, dynamic> _$MapboxStreetsV8ToJson(MapboxStreetsV8 instance) =>
    <String, dynamic>{
      'class': instance.mapboxStreetsV8Class,
    };

TollCollection _$TollCollectionFromJson(Map<String, dynamic> json) =>
    TollCollection(
      name: json['name'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$TollCollectionToJson(TollCollection instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
    };

Maneuver _$ManeuverFromJson(Map<String, dynamic> json) => Maneuver(
      type: json['type'] as String?,
      instruction: json['instruction'] as String?,
      bearingAfter: json['bearing_after'] as int?,
      bearingBefore: json['bearing_before'] as int?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      modifier: json['modifier'] as String?,
      exit: json['exit'] as int?,
    );

Map<String, dynamic> _$ManeuverToJson(Maneuver instance) => <String, dynamic>{
      'type': instance.type,
      'instruction': instance.instruction,
      'bearing_after': instance.bearingAfter,
      'bearing_before': instance.bearingBefore,
      'location': instance.location,
      'modifier': instance.modifier,
      'exit': instance.exit,
    };

Waypoint _$WaypointFromJson(Map<String, dynamic> json) => Waypoint(
      distance: (json['distance'] as num?)?.toDouble(),
      name: json['name'] as String?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$WaypointToJson(Waypoint instance) => <String, dynamic>{
      'distance': instance.distance,
      'name': instance.name,
      'location': instance.location,
    };
