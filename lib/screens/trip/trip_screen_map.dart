import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit/constants.dart';
import 'package:transit/database/db.dart';
import 'package:transit/models/db.dart';
import 'package:transit/screens/widgets/map.dart';
import 'package:transit/models/extensions.dart';

class TripScreenMap extends StatelessWidget {
  final List<Shape> shapes;
  final TransitRoute route;

  final List<StopWithStopTimes> stopsWithStopTimes;

  const TripScreenMap({
    super.key,
    required this.route,
    required this.stopsWithStopTimes,
    required this.shapes,
  });

  @override
  Widget build(BuildContext context) {
    return AppMap(
      center: _calculateShapeCenter(shapes),
      layers: [
        PolylineLayerOptions(
          polylines: [
            Polyline(
              points: [
                for (final shape in shapes)
                  LatLng(shape.shape_pt_lat, shape.shape_pt_lon),
              ],
              color: route.routeColor ?? Colors.blue,
              strokeWidth: 5,
            ),
          ],
        ),
        MarkerLayerOptions(
          markers: [
            for (final stopWithStopTimes in stopsWithStopTimes)
              AppMap.buildStopMarker(stopWithStopTimes.stop)
          ],
        ),
      ],
    );
  }

  LatLng _calculateShapeCenter(List<Shape> shapes) {
    if (shapes.isNotEmpty) {
      final points = shapes
          .map(
            (s) => LatLng(s.shape_pt_lat, s.shape_pt_lon),
          )
          .toList();

      final bounds = LatLngBounds.fromPoints(points);

      return bounds.center;
    } else {
      return defaultLatLng;
    }
  }
}
