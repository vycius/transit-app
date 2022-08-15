import 'package:flutter/services.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:drift/web.dart';

AppDatabase constructDb() {
  return AppDatabase(
    WebDatabase.withStorage(
      DriftWebStorage.indexedDb('db'),
      logStatements: true,
      initializer: () async {
        print('WebDatabase.withStorage blob');
        final blob = await rootBundle.load('assets/sqlite/db.sqlite');
        final buffer = blob.buffer;
        final bytes = buffer.asUint8List(
          blob.offsetInBytes,
          blob.lengthInBytes,
        );
        return bytes;
      },
    ),
  );
}
