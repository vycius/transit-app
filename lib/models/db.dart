import 'package:transit/database/db.dart';

class TripsWithStopTimes {
  final StopTime stopTime;
  final Trip trip;
  final TransitRoute route;

  TripsWithStopTimes(this.stopTime, this.trip, this.route);
}
