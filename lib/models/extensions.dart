import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit/database/db.dart';
import 'package:transit/utils.dart';

extension TransitRouteExtensions on TransitRoute {
  Color? get routeColor {
    if (route_color != null) {
      return hexToColor(route_color!);
    }

    return null;
  }

  Color? get routeTextColor {
    if (route_text_color != null) {
      return hexToColor(route_text_color!);
    }

    return null;
  }
}

extension StopExtensions on Stop {
  LatLng get latLng {
    return LatLng(stop_lat, stop_lon);
  }
}