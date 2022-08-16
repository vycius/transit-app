import 'package:flutter/material.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:transit/constants.dart';
import 'package:transit/database/database_service.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';
import 'package:transit/screens/widgets/map.dart';

class StopsMapTab extends StatelessWidget {
  const StopsMapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFutureBuilder<List<Stop>>(
      future: DatabaseService.get(context).getAllStopsOrderedByDistance(),
      builder: (context, stops) {
        return AppMap(
          center: defaultLatLng,
          stopsLayer: StopsMarkerLayer(stops: stops),
        );
      },
    );
  }
}
