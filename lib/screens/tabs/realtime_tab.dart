import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:gtfs_realtime_bindings/gtfs_realtime_bindings.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/constants.dart';
import 'package:transit/database/database_service.dart';
import 'package:transit/gtfs_realtime_service.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';
import 'package:transit/screens/widgets/map.dart';

class RealtimeTab extends StatelessWidget {
  const RealtimeTab({super.key});

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

        return StreamBuilder<FeedMessage>(
          stream: GTFSRealtimeService().streamGtfsRealtime(gtfsRealtimeUrl),
          builder: (context, snapshot) {
            var vehiclePositions = <VehiclePosition>[];
            if (snapshot.hasData) {
              vehiclePositions = snapshot.requireData.entity
                  .where((e) => e.hasVehicle())
                  .map((e) => e.vehicle)
                  .toList();
            }

            return RealtimeBody(
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

class RealtimeBody extends StatelessWidget {
  final List<VehiclePosition> vehiclePositions;
  final Map<String, Trip> tripLookup;
  final Map<String, TransitRoute> routeLookup;

  const RealtimeBody({
    super.key,
    required this.vehiclePositions,
    required this.tripLookup,
    required this.routeLookup,
  });

  @override
  Widget build(BuildContext context) {
    return AppMap(
      center: defaultLatLng,
      layers: [
        MarkerLayerOptions(
          markers: [
            for (final vehiclePosition in vehiclePositions)
              Marker(
                key: Key('vehicle-${vehiclePosition.vehicle.id}'),
                point: LatLng(
                  vehiclePosition.position.latitude,
                  vehiclePosition.position.longitude,
                ),
                anchorPos: AnchorPos.align(AnchorAlign.center),
                width: 25,
                height: 25,
                builder: (context) {
                  return _buildVehicleIcon(vehiclePosition);
                },
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildVehicleIcon(VehiclePosition vehiclePosition) {
    final trip = tripLookup[vehiclePosition.trip.tripId];
    final routeId = trip?.route_id;
    final route = (routeId != null) ? routeLookup[routeId] : null;

    final routeColor = route?.routeColor ?? Colors.teal;

    return Transform.rotate(
      angle: degToRadian(vehiclePosition.position.bearing),
      child: FloatingActionButton.small(
        onPressed: null,
        backgroundColor: routeColor,
        heroTag: null,
        child: _buildVehicleBody(route),
      ),
    );
  }

  Widget _buildVehicleBody(TransitRoute? route) {
    final routeShortName = route?.route_short_name;
    final routeTextColor = route?.routeTextColor ?? Colors.white;

    if (route != null && routeShortName != null) {
      return Text(routeShortName, style: TextStyle(color: routeTextColor));
    } else {
      return Icon(
        MdiIcons.bus,
        color: routeTextColor,
        size: 18,
      );
    }
  }
}
