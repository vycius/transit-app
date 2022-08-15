import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit/models/db.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/screens/widgets/map.dart';

class TripScreenMap extends StatelessWidget {
  final List<Shape> shapes;
  final Stop selectedStop;
  final TransitRoute selectedRoute;

  final List<StopWithStopTimes> stopsWithStopTimes;

  const TripScreenMap({
    super.key,
    required this.selectedRoute,
    required this.selectedStop,
    required this.stopsWithStopTimes,
    required this.shapes,
  });

  @override
  Widget build(BuildContext context) {
    return AppMap(
      center: selectedStop.latLng,
      layers: [
        PolylineLayerOptions(
          polylines: [
            Polyline(
              points: [
                for (final shape in shapes)
                  LatLng(shape.shape_pt_lat, shape.shape_pt_lon),
              ],
              color: selectedRoute.routeColor ?? Colors.blue,
              strokeWidth: 5,
            ),
          ],
        ),
        MarkerLayerOptions(
          markers: [
            for (final stopWithStopTimes in stopsWithStopTimes)
              AppMap.buildIndexedStopMarker(
                stop: stopWithStopTimes.stop,
                stopSequence: stopWithStopTimes.stopTime.stop_sequence,
                isActive:
                    selectedStop.stop_id == stopWithStopTimes.stop.stop_id,
              )
          ],
        ),
      ],
    );
  }
}
