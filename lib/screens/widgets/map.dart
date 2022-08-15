import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/constants.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/navigation_routes.dart';

class AppMap extends StatelessWidget {
  final LatLng? center;
  final List<MapPlugin> plugins;
  final List<LayerOptions> layers;

  AppMap({
    super.key,
    this.center,
    this.plugins = const [],
    this.layers = const [],
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: center ?? defaultLatLng,
        interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        plugins: [
          LocationMarkerPlugin(),
          ...plugins,
        ],
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'lt.transit.transit',
        ),
        LocationMarkerLayerOptions(),
        ...layers,
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

  static Marker buildStopMarker(Stop stop) {
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
                  MdiIcons.busStop,
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
