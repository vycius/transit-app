import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transit/database/db.dart';
import 'package:transit/models/db.dart';
import 'package:transit/screens/trip/trip_screen_body.dart';
import 'package:transit/screens/trip/trip_screen_map.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';

class TripScreenArguments {
  final TransitRoute selectedRoute;
  final Trip selectedTrip;
  final Stop selectedStop;

  TripScreenArguments({
    required this.selectedRoute,
    required this.selectedTrip,
    required this.selectedStop,
  });
}

class TripScreen extends StatelessWidget {
  final TripScreenArguments argumnets;

  Stop get selectedStop => argumnets.selectedStop;

  TransitRoute get selectedRoute => argumnets.selectedRoute;

  Trip get selectedTrip => argumnets.selectedTrip;

  TripScreen({super.key, required this.argumnets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedRoute.route_short_name}: ${selectedTrip.trip_short_name ?? selectedRoute.route_long_name}',
        ),
      ),
      body: AppFutureBuilder<_TripData>(
        future: _getTripData(context),
        builder: (context, tripData) {
          final stopsWithStopTimes = tripData.stopsWithStopTimes;
          final shapes = tripData.shapes;

          return SlidingUpPanel(
            defaultPanelState: PanelState.OPEN,
            // minHeight: 250,
            body: TripScreenMap(
              selectedStop: selectedStop,
              selectedRoute: selectedRoute,
              stopsWithStopTimes: stopsWithStopTimes,
              shapes: shapes,
            ),
            parallaxEnabled: true,
            panelBuilder: (scrollController) {
              return TripScreenListBody(
                scrollController: scrollController,
                selectedStop: selectedStop,
                stopsWithStopTimes: stopsWithStopTimes,
              );
            },
          );
        },
      ),
    );
  }

  Future<_TripData> _getTripData(BuildContext context) async {
    final database = AppDatabase.get(context);

    final stopWithStopTimes = await database.selectStopWithStopTimesForTrip(
      tripId: selectedTrip.trip_id,
    );

    final shapes = await database.getTripShapes(trip: selectedTrip);

    return _TripData(
      stopsWithStopTimes: stopWithStopTimes,
      shapes: shapes,
    );
  }
}

class _TripData {
  final List<StopWithStopTimes> stopsWithStopTimes;
  final List<Shape> shapes;

  _TripData({
    required this.stopsWithStopTimes,
    required this.shapes,
  });
}
