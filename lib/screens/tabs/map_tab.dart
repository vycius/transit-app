import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/database/db.dart';
import 'package:transit/navigation_routes.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';

class MapTab extends StatefulWidget {
  const MapTab({Key? key}) : super(key: key);

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  List<Stop> stops = [];

  @override
  Widget build(BuildContext context) {
    final stopIcon = FloatingActionButton.small(
      key: Key('map-stop-icon'),
      onPressed: null,
      backgroundColor: Colors.blue,
      child: Icon(
        MdiIcons.busStop,
        color: Colors.white,
        size: 18,
      ),
    );

    return AppFutureBuilder<List<Stop>>(
      future: AppDatabase.get(context).selectAllStopsWithRoutes(),
      builder: (context, stops) {
        return FlutterMap(
          options: MapOptions(
            center: LatLng(54.68916, 25.2798),
            plugins: [
              MarkerClusterPlugin(),
              LocationMarkerPlugin(),
            ],
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'lt.transit.transit',
            ),
            LocationMarkerLayerOptions(),
            MarkerClusterLayerOptions(
              disableClusteringAtZoom: 14,
              markers: [
                for (final stop in stops)
                  Marker(
                    key: Key('stop-${stop.stop_id}'),
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
                      child: stopIcon,
                    ),
                  ),
              ],
              builder: (context, markers) {
                return FloatingActionButton(
                  onPressed: null,
                  child: Text(markers.length.toString()),
                );
              },
            ),
          ],
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
            ),
          ],
        );
      },
    );
  }
}
