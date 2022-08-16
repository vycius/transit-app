import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:gtfs_realtime_bindings/gtfs_realtime_bindings.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit/constants.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/navigation_routes.dart';

class AppMap extends StatelessWidget {
  final LatLng? center;
  final List<MapPlugin> plugins;
  final List<LayerOptions> layers;
  final VehiclePositionsMarkerLayer? vehiclePositionsLayer;
  final StopsMarkerLayer? stopsLayer;

  AppMap({
    super.key,
    this.center,
    this.plugins = const [],
    this.layers = const [],
    this.vehiclePositionsLayer,
    this.stopsLayer,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: center ?? defaultLatLng,
        interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        plugins: [
          ...plugins,
        ],
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'lt.transit.transit',
        ),
        if (stopsLayer != null) stopsLayer!.buildLayer(),
        if (vehiclePositionsLayer != null) vehiclePositionsLayer!.buildLayer(),
        // ...layers,
      ],
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
        ),
      ],
    );
  }

  static Marker buildIndexedStopMarker({
    required Stop stop,
    required int stopSequence,
    required bool isActive,
  }) {
    return Marker(
      key: Key('marker-indexed-stop-${stop.stop_id}'),
      point: stop.latLng,
      anchorPos: AnchorPos.align(AnchorAlign.center),
      width: 24,
      height: 24,
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: isActive ? Colors.indigo : Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              stopSequence.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

class VehiclePositionsMarkerLayer {
  final List<VehiclePosition> vehiclePositions;
  final Map<String, Trip> tripLookup;
  final Map<String, TransitRoute> routeLookup;

  VehiclePositionsMarkerLayer({
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
            width: 25,
            height: 25,
            builder: (context) {
              return _buildVehicleIcon(
                vehiclePosition,
              );
            },
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
        Icons.directions_bus,
        color: routeTextColor,
        size: 18,
      );
    }
  }
}

class StopsMarkerLayer {
  final List<Stop> stops;

  StopsMarkerLayer({
    required this.stops,
  });

  MarkerLayerOptions buildLayer() {
    return MarkerLayerOptions(
      markers: [
        for (final stop in stops) _buildStopMarker(stop),
      ],
    );
  }

  Marker _buildStopMarker(Stop stop) {
    return Marker(
      key: Key('marker-stop-${stop.stop_id}'),
      point: stop.latLng,
      anchorPos: AnchorPos.align(AnchorAlign.center),
      width: 16,
      height: 16,
      builder: (context) {
        return GestureDetector(
          child: DecoratedBox(
            key: Key('marker-stop-body'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.indigo,
            ),
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              NavigationRoutes.routeStop,
              arguments: stop,
            );
          },
        );
      },
    );
  }
}
