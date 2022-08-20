import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:gtfs_realtime_bindings/gtfs_realtime_bindings.dart' as rt;
import 'package:latlong2/latlong.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/navigator_routes.dart';
import 'package:transit/screens/trip/trip_screen.dart';

class VehiclePositionMarkersLayer {
  final List<rt.VehiclePosition> vehiclePositions;
  final List<Trip> trips;
  final List<TransitRoute> routes;

  late Map<String, Trip> _tripLookup;
  late Map<String, TransitRoute> _routeLookup;

  VehiclePositionMarkersLayer({
    required this.vehiclePositions,
    required this.trips,
    required this.routes,
  }) {
    _tripLookup = HashMap.fromIterables(
      trips.map((t) => t.trip_id),
      trips,
    );

    _routeLookup = HashMap.fromIterables(
      routes.map((r) => r.route_id),
      routes,
    );
  }

  MarkerLayerOptions buildLayer() {
    return MarkerLayerOptions(
      markers: [
        for (final vehiclePosition in vehiclePositions)
          Marker(
            key: Key('vehicle-${vehiclePosition.vehicle.id}'),
            point: LatLng(
              vehiclePosition.position.latitude,
              vehiclePosition.position.longitude,
            ),
            anchorPos: AnchorPos.align(AnchorAlign.center),
            width: 20,
            height: 20,
            builder: (context) {
              return _buildVehicleIcon(
                context,
                vehiclePosition,
              );
            },
          ),
      ],
    );
  }

  Widget _buildVehicleIcon(
    BuildContext context,
    rt.VehiclePosition vehiclePosition,
  ) {
    final trip = _tripLookup[vehiclePosition.trip.tripId];
    final routeId = trip?.route_id;
    final route = (routeId != null) ? _routeLookup[routeId] : null;

    final routeColor = route?.routeColor ?? Colors.indigo;
    final routeTextColor = route?.routeTextColor ?? Colors.white;

    return Transform.rotate(
      angle: degToRadian(vehiclePosition.position.bearing),
      child: FloatingActionButton.small(
        onPressed: (route != null && trip != null)
            ? () => _onPressed(context, route, trip)
            : null,
        backgroundColor: routeColor,
        foregroundColor: routeTextColor,
        heroTag: null,
        child: _buildVehicleBody(route),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context, TransitRoute route, Trip trip) {
    return Navigator.pushNamed(
      context,
      NavigatorRoutes.routeTrip,
      arguments: TripScreenArguments(
        route: route,
        trip: trip,
        stop: null,
      ),
    );
  }

  Widget _buildVehicleBody(TransitRoute? route) {
    final routeShortName = route?.route_short_name;

    if (route != null && routeShortName != null) {
      return Padding(
        padding: const EdgeInsets.all(2),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            routeShortName,
            maxLines: 1,
          ),
        ),
      );
    } else {
      return Icon(
        Icons.directions_bus,
        size: 15,
      );
    }
  }
}
