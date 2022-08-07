import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
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
        (t) => OrderingTerm(expression: t.route_short_name),
      ]);
    return query.get();
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
