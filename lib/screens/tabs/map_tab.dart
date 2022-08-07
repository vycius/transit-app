import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/database/db.dart';
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
    final stopIcon = Icon(
      MdiIcons.bus,
      color: Colors.blue,
      size: 20,
      key: Key('map-stop-icon'),
    );

    return AppFutureBuilder<List<Stop>>(
      future: AppDatabase.get(context).selectAllStops(),
      builder: (context, stops) {
        return FlutterMap(
          options: MapOptions(
            center: LatLng(54.68916, 25.2798),
            zoom: 9.2,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'lt.transit.transit',
            ),
            MarkerLayerOptions(
              markers: [
                for (final stop in stops)
                  Marker(
                    point: LatLng(stop.stop_lat, stop.stop_lon),
                    width: 20,
                    height: 20,
                    builder: (context) => stopIcon,
                  ),
              ],
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
