import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:transit/database/tables.dart';

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

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

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

  Future<List<TransitRoute>> selectAllRoutes() {
    final query = select(transitRoutes)
      ..orderBy([
        (t) => OrderingTerm(expression: t.route_sort_order),
        (t) => OrderingTerm(expression: t.route_id),
      ]);
    return query.get();
  }

  Future<List<Stop>> selectAllStops({LatLng? currentPosition}) {
    final query = select(stops);

    return query.get();
  }

  Future<List<TripsWithStopTimes>> selectStopTimes(
    String stopId,
  ) {
    final query = select(stopTimes)
      ..where((s) => s.stop_id.equals(stopId))
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
        trips.route_id.equalsExp(transitRoutes.route_id),
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

  Future<void> deleteEverything() {
    return transaction(() async {
      await customStatement('PRAGMA foreign_keys = OFF');
      for (final table in allTables) {
        await delete(table).go();
      }
      await customStatement('PRAGMA foreign_keys = ON');
    });
  }
}

class TripsWithStopTimes {
  final StopTime stopTime;
  final Trip trip;
  final TransitRoute route;

  TripsWithStopTimes(this.stopTime, this.trip, this.route);
}
