import 'package:flutter/material.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:gtfs_realtime_bindings/gtfs_realtime_bindings.dart';
import 'package:transit/database/database_service.dart';
import 'package:transit/realtime/gtfs_realtime_service.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';
import 'package:transit/screens/widgets/map.dart';

class RouteScreen extends StatelessWidget {
  final TransitRoute route;

  const RouteScreen({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${route.route_short_name}: ${route.route_long_name}'),
      ),
      body: AppFutureBuilder<_RouteScreenFutureData>(
        future: _getFuture(context),
        builder: (context, data) {
          final gtfsRealtimeUrl = data.feedInfo.agency_gtfs_realtime_url;

          if (gtfsRealtimeUrl == null) {
            return Center(
              child: Text('Realaus laiko atvykimai nepalaikomi'),
            );
          }

          final stops = data.stops;
          print(stops.length.toString());
          final tripLookup = Map.fromIterables(
            data.trips.map((t) => t.trip_id),
            data.trips,
          );

          final routeLookup = Map.fromIterables(
            [route.route_id],
            [route],
          );

          return StreamBuilder<List<VehiclePosition>>(
            stream: GTFSRealtimeService()
                .streamGtfsRealtimeVehiclePositions(gtfsRealtimeUrl),
            builder: (context, snapshot) {
              final vehiclePositions = snapshot.data ?? [];
              final filteredVehiclePositions = vehiclePositions
                  .where((v) => tripLookup.containsKey(v.trip.tripId))
                  .toList();

              return AppMap(
                stopsLayer: StopsMarkerLayer(stops: stops),
                vehiclePositionsLayer: VehiclePositionsMarkerLayer(
                  vehiclePositions: filteredVehiclePositions,
                  tripLookup: tripLookup,
                  routeLookup: routeLookup,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<_RouteScreenFutureData> _getFuture(BuildContext context) async {
    final database = DatabaseService.get(context);

    return _RouteScreenFutureData(
      feedInfo: await database.getFeedInfo(),
      stops: await database.getStopsByRoute(route),
      trips: await database.getTripsByRoute(route),
    );
  }
}

class _RouteScreenFutureData {
  final FeedInfoData feedInfo;
  final List<Stop> stops;
  final List<Trip> trips;

  _RouteScreenFutureData({
    required this.feedInfo,
    required this.stops,
    required this.trips,
  });
}
