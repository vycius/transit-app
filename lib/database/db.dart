import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:transit/database/tables.dart';
import 'package:transit/models/db.dart';

part 'db.g.dart';

@DriftDatabase(
  tables: [
    Stops,
    TransitRoutes,
    Calendar,
    Trips,
    StopTimes,
    Shapes,
    CalendarDates,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  static AppDatabase get(BuildContext context) {
    return Provider.of<AppDatabase>(
      context,
      listen: false,
    );
  }

  Future<int> stopsCount() {
    final stopsCount = stops.stop_id.count();
    final query = selectOnly(stops)..addColumns([stopsCount]);

    return query.map((row) => row.read(stopsCount)).getSingle();
  }

  Future<int> routesCount() {
    final routesCount = transitRoutes.route_id.count();
    final query = selectOnly(transitRoutes)..addColumns([routesCount]);

    return query.map((row) => row.read(routesCount)).getSingle();
  }

  Future<List<TransitRoute>> getAllRoutes() async {
    final query = select(transitRoutes)
      ..orderBy([
        (t) => OrderingTerm(expression: t.route_sort_order),
        (t) => OrderingTerm(expression: t.route_id),
      ]);

    final rows = await query.get();

    return rows.sortedByCompare(
      (r) => '${r.route_color} ${r.route_short_name}',
      compareNatural,
    );
  }

  Future<List<Stop>> selectAllStopsWithRoutes({LatLng? currentPosition}) async {
    final query = select(stops);

    final allStops = await query.get();
    final distance = Distance();

    if (currentPosition == null) {
      return allStops;
    } else {
      return allStops.sortedBy<num>(
        (s) => distance.as(
          LengthUnit.Meter,
          LatLng(s.stop_lat, s.stop_lon),
          currentPosition,
        ),
      );
    }
  }

  Expression<bool> _calendarWeekdayExpression(DateTime dateTime) {
    switch (dateTime.weekday) {
      case DateTime.monday:
        return calendar.monday.equals(true);
      case DateTime.tuesday:
        return calendar.tuesday.equals(true);
      case DateTime.wednesday:
        return calendar.wednesday.equals(true);
      case DateTime.thursday:
        return calendar.thursday.equals(true);
      case DateTime.friday:
        return calendar.friday.equals(true);
      case DateTime.saturday:
        return calendar.saturday.equals(true);
      case DateTime.sunday:
        return calendar.sunday.equals(true);
      default:
        throw Exception('Unable to map weekday');
    }
  }

  Future<List<TripsWithStopTimes>> selectStopTimes(
    String stopId,
    DateTime dateTime,
  ) {
    final localDateTime = dateTime.toLocal();

    final timeFormat = DateFormat('HH:mm:ss');
    final timeFormatted = timeFormat.format(localDateTime.toLocal());
    final dateFormat = DateFormat('yyyyMMdd');
    final dateFormatted = dateFormat.format(localDateTime.toLocal());

    final query = select(stopTimes)
      ..where((s) => s.stop_id.equals(stopId))
      ..where((s) => s.arrival_time.isBiggerOrEqualValue(timeFormatted))
      ..orderBy([
        (t) => OrderingTerm(expression: t.arrival_time),
        (t) => OrderingTerm(expression: t.departure_time),
      ]);

    final joinedQuery = query.join([
      innerJoin(
        trips,
        trips.trip_id.equalsExp(stopTimes.trip_id),
      ),
      innerJoin(
        transitRoutes,
        transitRoutes.route_id.equalsExp(trips.route_id),
      ),
      innerJoin(
        calendar,
        calendar.service_id.equalsExp(trips.service_id) &
            calendar.start_date.isSmallerOrEqualValue(dateFormatted) &
            calendar.end_date.isBiggerOrEqualValue(dateFormatted) &
            _calendarWeekdayExpression(localDateTime),
      ),
    ]).map((row) {
      return TripsWithStopTimes(
        row.readTable(stopTimes),
        row.readTable(trips),
        row.readTable(transitRoutes),
      );
    });

    return joinedQuery.get();
  }

  Future<List<StopWithStopTimes>> selectStopWithStopTimesForTrip({
    required String tripId,
  }) {
    final query = select(stopTimes)
      ..where((s) => s.trip_id.equals(tripId))
      ..orderBy([
        (t) => OrderingTerm.asc(t.stop_sequence),
      ]);

    final joinedQuery = query.join([
      innerJoin(
        stops,
        stops.stop_id.equalsExp(stopTimes.stop_id),
      ),
    ]).map((row) {
      return StopWithStopTimes(
        row.readTable(stops),
        row.readTable(stopTimes),
      );
    });

    return joinedQuery.get();
  }

  Future<List<Shape>> getTripShapes({required Trip trip}) {
    final query = select(shapes)
      ..where((s) => s.shape_id.equals(trip.shape_id))
      ..orderBy([(s) => OrderingTerm.asc(s.shape_pt_sequence)]);

    return query.get();
  }

  Future<List<Trip>> getAllTrips() {
    return select(trips).get();
  }

  Future<List<Trip>> selectTrips(TransitRoute route) {
    final query = select(trips)
      ..where((r) => r.route_id.equals(route.route_id));

    return query.get();
  }

  Future<List<TransitRoute>> selectRoutesByStop(Stop stop) {
    return select(transitRoutes)
        .join(
          [
            innerJoin(
              trips,
              trips.route_id.equalsExp(transitRoutes.route_id),
              useColumns: false,
            ),
            innerJoin(
              stopTimes,
              stopTimes.trip_id.equalsExp(trips.trip_id) &
                  stopTimes.stop_id.equals(stop.stop_id),
              useColumns: false,
            ),
          ],
        )
        .map((row) => row.readTable(transitRoutes))
        .get();
  }

  Future<List<TransitRoute>> selectStopsWithRoutes(Stop stop) {
    return select(transitRoutes)
        .join(
          [
            innerJoin(
              trips,
              trips.route_id.equalsExp(transitRoutes.route_id),
              useColumns: false,
            ),
            innerJoin(
              stopTimes,
              stopTimes.trip_id.equalsExp(trips.trip_id) &
                  stopTimes.stop_id.equals(stop.stop_id),
              useColumns: false,
            ),
          ],
        )
        .map((row) => row.readTable(transitRoutes))
        .get();
  }

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}
