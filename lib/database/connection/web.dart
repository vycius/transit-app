import 'package:drift/web.dart';
import 'package:transit/database/db.dart';

AppDatabase constructDb() {
  return AppDatabase(
    WebDatabase.withStorage(
      DriftWebStorage.indexedDb('db'),
      logStatements: true,
    ),
  );
}
