import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:gtfs_realtime_bindings/gtfs_realtime_bindings.dart' as rt;
import 'package:latlong2/latlong.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/navigation_routes.dart';
import 'package:transit/screens/trip/trip_screen.dart';

class VehiclePositionMarkersLayer {
  final List<rt.VehiclePosition> vehiclePositions;
  final Map<String, Trip> tripLookup;
  final Map<String, TransitRoute> routeLookup;

  VehiclePositionMarkersLayer({
    required this.vehiclePositions,
    required this.tripLookup,
    required this.routeLookup,
  });

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
    final trip = tripLookup[vehiclePosition.trip.tripId];
    final routeId = trip?.route_id;
    final route = (routeId != null) ? routeLookup[routeId] : null;

    final routeColor = route?.routeColor ?? Colors.indigo;

    final vehicleIcon = Transform.rotate(
      angle: degToRadian(vehiclePosition.position.bearing),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: routeColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: _buildVehicleBody(route),
        ),
      ),
    );

    if (route != null && trip != null) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            NavigationRoutes.routeTrip,
            arguments: TripScreenArguments(
              route: route,
              trip: trip,
              stop: null,
            ),
          );
        },
        child: vehicleIcon,
      );
    } else {
      return vehicleIcon;
    }
  }

  Widget _buildVehicleBody(TransitRoute? route) {
    final routeShortName = route?.route_short_name;
    final routeTextColor = route?.routeTextColor ?? Colors.white;

    if (route != null && routeShortName != null) {
      return Padding(
        padding: const EdgeInsets.all(4),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            routeShortName,
            style: TextStyle(color: routeTextColor),
            maxLines: 1,
          ),
        ),
      );
    } else {
      return Icon(
        Icons.directions_bus,
        color: routeTextColor,
        size: 15,
      );
    }
  }
}
