import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/widgets/map.dart';

class TripScreenMap extends StatelessWidget {
  final List<Shape> shapes;
  final TransitRoute selectedRoute;
  final List<Stop> stops;

  const TripScreenMap({
    super.key,
    required this.selectedRoute,
    required this.stops,
    required this.shapes,
  });

  @override
  Widget build(BuildContext context) {
    return AppMap(
      center: _calculateCenter(),
      shapesPolylineLayer: ShapesPolylineLayer(
        lines: [shapes],
        color: selectedRoute.routeColor ?? Colors.indigo,
      ),
      stopsLayer: StopsMarkerLayer(
        stops: stops,
      ),
    );
  }

  LatLng _calculateCenter() {
    final points = stops.map((s) => s.latLng).toList();
    return LatLngBounds.fromPoints(points).center;
  }
}
