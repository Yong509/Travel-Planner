import 'package:json_annotation/json_annotation.dart';

part 'direction.g.dart';

@JsonSerializable()
class Direction {
  @JsonKey(name: "routes")
  List<Route>? routes;
  @JsonKey(name: "waypoints")
  List<Waypoint>? waypoints;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "uuid")
  String? uuid;

  Direction({
    this.routes,
    this.waypoints,
    this.code,
    this.uuid,
  });

  factory Direction.fromJson(Map<String, dynamic> json) =>
      _$DirectionFromJson(json);

  Map<String, dynamic> toJson() => _$DirectionToJson(this);
}

@JsonSerializable()
class Route {
  @JsonKey(name: "weight_typical")
  double? weightTypical;
  @JsonKey(name: "duration_typical")
  double? durationTypical;
  @JsonKey(name: "weight_name")
  String? weightName;
  @JsonKey(name: "weight")
  double? weight;
  @JsonKey(name: "duration")
  double? duration;
  @JsonKey(name: "distance")
  double? distance;
  @JsonKey(name: "legs")
  List<Leg>? legs;
  @JsonKey(name: "geometry")
  String? geometry;

  Route({
    this.weightTypical,
    this.durationTypical,
    this.weightName,
    this.weight,
    this.duration,
    this.distance,
    this.legs,
    this.geometry,
  });

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  Map<String, dynamic> toJson() => _$RouteToJson(this);
}

@JsonSerializable()
class Leg {
  @JsonKey(name: "via_waypoints")
  List<dynamic>? viaWaypoints;
  @JsonKey(name: "admins")
  List<Admin>? admins;
  @JsonKey(name: "weight_typical")
  double? weightTypical;
  @JsonKey(name: "duration_typical")
  double? durationTypical;
  @JsonKey(name: "weight")
  double? weight;
  @JsonKey(name: "duration")
  double? duration;
  @JsonKey(name: "steps")
  List<Step>? steps;
  @JsonKey(name: "distance")
  double? distance;
  @JsonKey(name: "summary")
  String? summary;

  Leg({
    this.viaWaypoints,
    this.admins,
    this.weightTypical,
    this.durationTypical,
    this.weight,
    this.duration,
    this.steps,
    this.distance,
    this.summary,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);

  Map<String, dynamic> toJson() => _$LegToJson(this);
}

@JsonSerializable()
class Admin {
  @JsonKey(name: "iso_3166_1")
  String? iso31661;

  Admin({
    this.iso31661,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);

  Map<String, dynamic> toJson() => _$AdminToJson(this);
}

@JsonSerializable()
class Step {
  @JsonKey(name: "intersections")
  List<Intersection>? intersections;
  @JsonKey(name: "maneuver")
  Maneuver? maneuver;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "weight_typical")
  double? weightTypical;
  @JsonKey(name: "duration_typical")
  double? durationTypical;
  @JsonKey(name: "duration")
  double? duration;
  @JsonKey(name: "distance")
  double? distance;
  @JsonKey(name: "driving_side")
  String? drivingSide;
  @JsonKey(name: "weight")
  double? weight;
  @JsonKey(name: "mode")
  String? mode;
  @JsonKey(name: "geometry")
  String? geometry;
  @JsonKey(name: "ref")
  String? ref;
  @JsonKey(name: "destinations")
  String? destinations;
  @JsonKey(name: "exits")
  String? exits;

  Step({
    this.intersections,
    this.maneuver,
    this.name,
    this.weightTypical,
    this.durationTypical,
    this.duration,
    this.distance,
    this.drivingSide,
    this.weight,
    this.mode,
    this.geometry,
    this.ref,
    this.destinations,
    this.exits,
  });

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

  Map<String, dynamic> toJson() => _$StepToJson(this);
}

@JsonSerializable()
class Intersection {
  @JsonKey(name: "entry")
  List<bool>? entry;
  @JsonKey(name: "bearings")
  List<int>? bearings;
  @JsonKey(name: "duration")
  double? duration;
  @JsonKey(name: "mapbox_streets_v8")
  MapboxStreetsV8? mapboxStreetsV8;
  @JsonKey(name: "is_urban")
  bool? isUrban;
  @JsonKey(name: "admin_index")
  int? adminIndex;
  @JsonKey(name: "out")
  int? out;
  @JsonKey(name: "weight")
  double? weight;
  @JsonKey(name: "geometry_index")
  int? geometryIndex;
  @JsonKey(name: "location")
  List<double>? location;
  @JsonKey(name: "in")
  int? intersectionIn;
  @JsonKey(name: "turn_weight")
  double? turnWeight;
  @JsonKey(name: "turn_duration")
  double? turnDuration;
  @JsonKey(name: "lanes")
  List<Lane>? lanes;
  @JsonKey(name: "toll_collection")
  TollCollection? tollCollection;
  @JsonKey(name: "classes")
  List<String>? classes;
  @JsonKey(name: "traffic_signal")
  bool? trafficSignal;
  @JsonKey(name: "railway_crossing")
  bool? railwayCrossing;

  Intersection({
    this.entry,
    this.bearings,
    this.duration,
    this.mapboxStreetsV8,
    this.isUrban,
    this.adminIndex,
    this.out,
    this.weight,
    this.geometryIndex,
    this.location,
    this.intersectionIn,
    this.turnWeight,
    this.turnDuration,
    this.lanes,
    this.tollCollection,
    this.classes,
    this.trafficSignal,
    this.railwayCrossing,
  });

  factory Intersection.fromJson(Map<String, dynamic> json) =>
      _$IntersectionFromJson(json);

  Map<String, dynamic> toJson() => _$IntersectionToJson(this);
}

@JsonSerializable()
class Lane {
  @JsonKey(name: "indications")
  List<String>? indications;
  @JsonKey(name: "valid")
  bool? valid;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "valid_indication")
  String? validIndication;

  Lane({
    this.indications,
    this.valid,
    this.active,
    this.validIndication,
  });

  factory Lane.fromJson(Map<String, dynamic> json) => _$LaneFromJson(json);

  Map<String, dynamic> toJson() => _$LaneToJson(this);
}

@JsonSerializable()
class MapboxStreetsV8 {
  @JsonKey(name: "class")
  String? mapboxStreetsV8Class;

  MapboxStreetsV8({
    this.mapboxStreetsV8Class,
  });

  factory MapboxStreetsV8.fromJson(Map<String, dynamic> json) =>
      _$MapboxStreetsV8FromJson(json);

  Map<String, dynamic> toJson() => _$MapboxStreetsV8ToJson(this);
}

@JsonSerializable()
class TollCollection {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "type")
  String? type;

  TollCollection({
    this.name,
    this.type,
  });

  factory TollCollection.fromJson(Map<String, dynamic> json) =>
      _$TollCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$TollCollectionToJson(this);
}

@JsonSerializable()
class Maneuver {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "instruction")
  String? instruction;
  @JsonKey(name: "bearing_after")
  int? bearingAfter;
  @JsonKey(name: "bearing_before")
  int? bearingBefore;
  @JsonKey(name: "location")
  List<double>? location;
  @JsonKey(name: "modifier")
  String? modifier;
  @JsonKey(name: "exit")
  int? exit;

  Maneuver({
    this.type,
    this.instruction,
    this.bearingAfter,
    this.bearingBefore,
    this.location,
    this.modifier,
    this.exit,
  });

  factory Maneuver.fromJson(Map<String, dynamic> json) =>
      _$ManeuverFromJson(json);

  Map<String, dynamic> toJson() => _$ManeuverToJson(this);
}

@JsonSerializable()
class Waypoint {
  @JsonKey(name: "distance")
  double? distance;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "location")
  List<double>? location;

  Waypoint({
    this.distance,
    this.name,
    this.location,
  });

  factory Waypoint.fromJson(Map<String, dynamic> json) =>
      _$WaypointFromJson(json);

  Map<String, dynamic> toJson() => _$WaypointToJson(this);
}
