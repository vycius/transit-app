import 'package:drift/web.dart';
import 'package:flutter/services.dart';
import 'package:transit/database/database_service.dart';

DatabaseService constructDb() {
  return DatabaseService(
    WebDatabase.withStorage(
      DriftWebStorage.indexedDb('db'),
      logStatements: true,
      initializer: () async {
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
