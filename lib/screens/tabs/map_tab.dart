import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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
          layers: [
            MarkerLayerOptions(
              markers: [
                for (final stop in stops) AppMap.buildStopMarker(stop),
              ],
            ),
          ],
        );
      },
    );
  }
}
