import 'package:flutter/material.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/constants.dart';
import 'package:transit/database/database_service.dart';
import 'package:transit/models/extensions.dart';
import 'package:transit/navigation_routes.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';

class StopsTab extends StatelessWidget {
  const StopsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPosition = defaultLatLng;

    final database = DatabaseService.get(context);

    return AppFutureBuilder<List<Stop>>(
      future: database.getAllStopsOrderedByDistance(
        currentPosition: currentPosition,
      ),
      builder: (BuildContext context, stops) {
        return ListView.separated(
          itemCount: stops.length,
          separatorBuilder: (context, i) => Divider(height: 1),
          itemBuilder: (context, index) {
            final stop = stops[index];

            return ListTile(
              leading: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.indigo,
                ),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      MdiIcons.busStop,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Text(stop.stop_name),
              subtitle: Text(_formatDistance(stop, currentPosition)),
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
      },
    );
  }

  String _formatDistance(Stop stop, LatLng? currentPosition) {
    if (currentPosition == null) {
      return '';
    } else {
      final distance = Distance();

      final distanceM = distance
          .as(
            LengthUnit.Meter,
            stop.latLng,
            currentPosition,
          )
          .toInt();

      return '$distanceM m';
    }
  }
}
