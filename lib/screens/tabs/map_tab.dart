import 'package:flutter/material.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:transit/constants.dart';
import 'package:transit/database/db.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';
import 'package:transit/screens/widgets/map.dart';

class MapTab extends StatelessWidget {
  const MapTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppFutureBuilder<List<Stop>>(
      future: AppDatabase.get(context).selectAllStopsWithRoutes(),
      builder: (context, stops) {
        return AppMap(
          center: defaultLatLng,
          plugins: [
            MarkerClusterPlugin(),
          ],
          layers: [
            MarkerClusterLayerOptions(
              disableClusteringAtZoom: 14,
              markers: [
                for (final stop in stops) AppMap.buildStopMarker(stop),
              ],
              builder: (context, markers) {
                return FloatingActionButton(
                  onPressed: null,
                  child: Text(markers.length.toString()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
