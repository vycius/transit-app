import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/database/db.dart';
import 'package:transit/navigation_routes.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';
import 'package:latlong2/latlong.dart';

class StopsTab extends StatelessWidget {
  const StopsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPosition = LatLng(54.7081385, 25.2497002);

    final database = AppDatabase.get(context);

    return AppFutureBuilder<List<Stop>>(
      future: database.selectAllStops(currentPosition: currentPosition),
      builder: (BuildContext context, stops) {
        return ListView.separated(
          itemCount: stops.length,
          separatorBuilder: (context, i) => Divider(height: 1),
          itemBuilder: (context, index) {
            final stop = stops[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  MdiIcons.busStop,
                  color: Colors.white,
                ),
              ),
              title: Text(stop.stop_name),
              subtitle: Text(_formatDistance(stop, currentPosition)),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NavigationRoutes.stop,
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
            LatLng(stop.stop_lat, stop.stop_lon),
            currentPosition,
          )
          .toInt();

      return '$distanceM m';
    }
  }
}
