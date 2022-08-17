import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:gtfs_realtime_bindings/gtfs_realtime_bindings.dart' as rt;
import 'package:latlong2/latlong.dart';
import 'package:transit/constants.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/navigation_routes.dart';
import 'package:transit/screens/trip/trip_screen.dart';

class AppMap extends StatelessWidget {
  final LatLng? center;
  final List<MapPlugin> plugins;
  final List<LayerOptions> layers;
  final VehiclePositionsMarkerLayer? vehiclePositionsLayer;
  final StopsMarkerLayer? stopsLayer;
  final ShapesPolylineLayer? shapesPolylineLayer;

  AppMap({
    super.key,
    this.center,
    this.plugins = const [],
    this.layers = const [],
    this.vehiclePositionsLayer,
    this.stopsLayer,
    this.shapesPolylineLayer,
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
        if (shapesPolylineLayer != null) shapesPolylineLayer!.buildLayer(),
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

class ShapesPolylineLayer {
  final List<List<Shape>> lines;
  final Color color;

  ShapesPolylineLayer({
    required this.lines,
    required this.color,
  });

  PolylineLayerOptions buildLayer() {
    return PolylineLayerOptions(
      polylines: [
        for (final shapes in lines)
          Polyline(
            points: [
              for (final shape in shapes)
                LatLng(shape.shape_pt_lat, shape.shape_pt_lon),
            ],
            color: color,
            strokeWidth: 5,
          ),
      ],
    );
  }
}

class VehiclePositionsMarkerLayer {
  final List<rt.VehiclePosition> vehiclePositions;
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
