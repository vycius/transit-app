import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit/constants.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/widgets/map/layers/shapes_polyline_layer.dart';
import 'package:transit/widgets/map/layers/stops_marker_layer.dart';
import 'package:transit/widgets/map/layers/vehicle_positions_markers_layer.dart';

class TransitMap extends StatelessWidget {
  final LatLng? center;
  final VehiclePositionMarkersLayer? vehiclePositionsLayer;
  final StopsMarkerLayer? stopsLayer;
  final ShapesPolylineLayer? shapesPolylineLayer;

  TransitMap({
    super.key,
    this.center,
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
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'lt.transit.transit',
        ),
        if (shapesPolylineLayer != null) shapesPolylineLayer!.buildLayer(),
        if (stopsLayer != null) stopsLayer!.buildLayer(),
        if (vehiclePositionsLayer != null) vehiclePositionsLayer!.buildLayer(),
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
