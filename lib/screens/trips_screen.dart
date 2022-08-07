import 'package:flutter/material.dart';
import 'package:transit/database/db.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';

class TripsScreen extends StatelessWidget {
  final TransitRoute route;

  TripsScreen({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${route.route_short_name}: ${route.route_long_name}'),
      ),
      body: AppFutureBuilder<List<Trip>>(
        future: AppDatabase.get(context).selectTrips(route),
        builder: (context, trips) {
          return ListView.separated(
            itemCount: trips.length,
            separatorBuilder: (context, i) => Divider(height: 1),
            itemBuilder: (context, index) {
              final trip = trips[index];
              return ListTile(
                title: Text(trip.trip_headsign ?? trip.trip_short_name ?? ''),
                subtitle: trip.trip_short_name != null
                    ? Text(trip.trip_short_name ?? '')
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}
