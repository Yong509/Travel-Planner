enum RoutingProfile { drivingTraffic, driving, walking, cycling }

getRoutingProfileValue(RoutingProfile profile) {
  switch (profile) {
    case RoutingProfile.drivingTraffic:
      return "driving-traffic";
    case RoutingProfile.cycling:
      return "cycling";
    case RoutingProfile.driving:
      return "driving";
    case RoutingProfile.walking:
      return "walking"; // Assigning a custom value
  }
}
