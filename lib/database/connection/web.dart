import 'package:drift/web.dart';
import 'package:flutter/services.dart';
import 'package:transit/database/db.dart';

AppDatabase constructDb() {
  return AppDatabase(
    WebDatabase.withStorage(
      DriftWebStorage.indexedDb('db'),
      logStatements: true,
      initializer: () async {
        print('WebDatabase.withStorage blob');
        final blob = await rootBundle.load('assets/db-vilnius.sqlite');
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
