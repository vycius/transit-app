import 'package:flutter/material.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:gtfs_realtime_bindings/gtfs_realtime_bindings.dart';
import 'package:transit/constants.dart';
import 'package:transit/database/database_service.dart';
import 'package:transit/realtime/gtfs_realtime_service.dart';
import 'package:transit/widgets/app_future_loader.dart';
import 'package:transit/widgets/map.dart';

class RealtimeVehiclesTab extends StatelessWidget {
  const RealtimeVehiclesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFutureBuilder<_RealtimeTabData>(
      future: _getFuture(context),
      builder: (context, data) {
        final trips = data.trips;
        final routes = data.routes;
        final gtfsRealtimeUrl = data.feedInfo.agency_gtfs_realtime_url;

        if (gtfsRealtimeUrl == null) {
          return Center(
            child: Text('Realaus laiko atvykimai nepalaikomi'),
          );
        }

        final tripLookup = Map.fromIterables(
          trips.map((t) => t.trip_id),
          trips,
        );

        final routeLookup = Map.fromIterables(
          routes.map((r) => r.route_id),
          routes,
        );

        return StreamBuilder<List<VehiclePosition>>(
          stream: GTFSRealtimeService()
              .streamGtfsRealtimeVehiclePositions(gtfsRealtimeUrl),
          builder: (context, snapshot) {
            final vehiclePositions = snapshot.data ?? [];

            return _RealtimeVehiclesTabBody(
              vehiclePositions: vehiclePositions,
              tripLookup: tripLookup,
              routeLookup: routeLookup,
            );
          },
        );
      },
    );
  }

  Future<_RealtimeTabData> _getFuture(BuildContext context) async {
    final database = DatabaseService.get(context);

    return _RealtimeTabData(
      feedInfo: await database.getFeedInfo(),
      routes: await database.getAllRoutes(),
      trips: await database.getAllTrips(),
    );
  }
}

class _RealtimeTabData {
  final FeedInfoData feedInfo;
  final List<TransitRoute> routes;
  final List<Trip> trips;

  _RealtimeTabData({
    required this.feedInfo,
    required this.routes,
    required this.trips,
  });
}

class _RealtimeVehiclesTabBody extends StatelessWidget {
  final List<VehiclePosition> vehiclePositions;
  final Map<String, Trip> tripLookup;
  final Map<String, TransitRoute> routeLookup;

  const _RealtimeVehiclesTabBody({
    required this.vehiclePositions,
    required this.tripLookup,
    required this.routeLookup,
  });

  @override
  Widget build(BuildContext context) {
    return AppMap(
      center: defaultLatLng,
      vehiclePositionsLayer: VehiclePositionsMarkerLayer(
        vehiclePositions: vehiclePositions,
        tripLookup: tripLookup,
        routeLookup: routeLookup,
      ),
    );
  }
}
