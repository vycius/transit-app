import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transit/constants.dart';
import 'package:transit/database/db.dart';
import 'package:transit/models/db.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';
import 'package:transit/screens/widgets/map.dart';

class TripScreenArguments {
  final TransitRoute route;
  final Trip trip;
  final Stop stop;

  TripScreenArguments({
    required this.route,
    required this.trip,
    required this.stop,
  });
}

class TripScreen extends StatelessWidget {
  final TripScreenArguments argumnets;

  Stop get stop => argumnets.stop;

  TransitRoute get route => argumnets.route;

  Trip get trip => argumnets.trip;

  TripScreen({super.key, required this.argumnets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${route.route_short_name}: ${trip.trip_short_name ?? route.route_long_name}',
        ),
      ),
      body: AppFutureBuilder<_TripData>(
        future: _getTripData(context),
        builder: (context, tripData) {
          return SlidingUpPanel(
            minHeight: 250,
            body: AppMap(
              center: _calculateShapeCenter(tripData.shapes),
              layers: [
                PolylineLayerOptions(
                  polylines: [
                    Polyline(
                      points: [
                        for (final shape in tripData.shapes)
                          LatLng(shape.shape_pt_lat, shape.shape_pt_lon),
                      ],
                      color: route.routeColor ?? Colors.blue,
                      strokeWidth: 5,
                    ),
                  ],
                ),
                MarkerLayerOptions(
                  markers: [
                    for (final stopWithStopTimes in tripData.stopWithStopTimes)
                      AppMap.buildStopMarker(stopWithStopTimes.stop)
                  ],
                ),
              ],
            ),
            parallaxEnabled: true,
            panelBuilder: (controller) {
              final stopWithStopTimes = tripData.stopWithStopTimes;

              return ListView.separated(
                itemCount: stopWithStopTimes.length,
                controller: controller,
                separatorBuilder: (context, i) => Divider(height: 1),
                itemBuilder: (context, index) {
                  final stopTime = stopWithStopTimes[index].stopTime;
                  final stop = stopWithStopTimes[index].stop;

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      child: Text(stopTime.stop_sequence.toString()),
                    ),
                    title: Text(stop.stop_name),
                    trailing: Text(stopTime.departure_time),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<_TripData> _getTripData(BuildContext context) async {
    final database = AppDatabase.get(context);

    final stopWithStopTimes = await database.selectStopWithStopTimesForTrip(
      tripId: trip.trip_id,
    );

    final shapes = await database.getTripShapes(trip: trip);

    return _TripData(
      stopWithStopTimes: stopWithStopTimes,
      shapes: shapes,
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

class _TripData {
  final List<StopWithStopTimes> stopWithStopTimes;
  final List<Shape> shapes;

  _TripData({
    required this.stopWithStopTimes,
    required this.shapes,
  });
}
