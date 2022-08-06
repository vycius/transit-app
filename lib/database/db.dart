import 'package:drift/drift.dart';
import 'package:transit/database/tables.dart';

part 'db.g.dart';

@DriftDatabase(tables: [
  Stops,
  Routes,
  Calendar,
  Trips,
  StopTimes,
  Shapes,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

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

  Future<int> stopsCount() {
    final stopsCount = stops.stop_id.count();
    final query = selectOnly(stops)..addColumns([stopsCount]);

    return query.map((row) => row.read(stopsCount)).getSingle();
  }

  Future<List<Route>> selectAllRoutes() {
    final query = select(routes)
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
