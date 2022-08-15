import 'package:flutter/material.dart';
import 'package:transit/database/db.dart';
import 'package:transit/models/db.dart';
import 'package:transit/navigation_routes.dart';
import 'package:transit/screens/trip/trip_screen.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';
import 'package:transit/screens/widgets/route_avatar.dart';

class StopScreen extends StatelessWidget {
  final Stop stop;

  const StopScreen({super.key, required this.stop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stop.stop_name),
      ),
      body: AppFutureBuilder<List<TripsWithStopTimes>>(
        future: AppDatabase.get(context).selectStopTimes(
          stop.stop_id,
          DateTime.now(),
        ),
        builder: (context, tripsWithTimes) {
          return ListView.separated(
            itemCount: tripsWithTimes.length,
            separatorBuilder: (context, i) => Divider(height: 1),
            itemBuilder: (context, index) {
              final tripWithTime = tripsWithTimes[index];
              final trip = tripWithTime.trip;
              final stopTimes = tripWithTime.stopTime;
              final route = tripWithTime.route;

              return ListTile(
                leading: RouteAvatar(route: route),
                title: Text(trip.trip_headsign ?? ''),
                subtitle: Text(trip.trip_short_name ?? route.route_long_name),
                trailing: Text(stopTimes.departure_time),
                onTap: () => Navigator.pushNamed(
                  context,
                  NavigationRoutes.routeTrip,
                  arguments: TripScreenArguments(
                    selectedRoute: route,
                    selectedTrip: trip,
                    selectedStop: stop,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}