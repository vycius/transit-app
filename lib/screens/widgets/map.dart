import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/constants.dart';
import 'package:transit/database/db.dart';
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

  static Marker buildStopMarker(Stop stop) {
    return Marker(
      key: Key('marker-stop-${stop.stop_id}'),
      point: LatLng(stop.stop_lat, stop.stop_lon),
      anchorPos: AnchorPos.align(AnchorAlign.center),
      width: 25,
      height: 25,
      builder: (context) => FloatingActionButton.small(
        onPressed: () {
          Navigator.pushNamed(
            context,
            NavigationRoutes.routeStop,
            arguments: stop,
          );
        },
        backgroundColor: Colors.blue,
        heroTag: null,
        child: FloatingActionButton.small(
          onPressed: null,
          backgroundColor: Colors.blue,
          child: Icon(
            MdiIcons.busStop,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
