import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

AppDatabase constructDb() {
  final db = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load(
        'packages/gtfs_db/assets/sqlite/db.sqlite',
      );

      final buffer = blob.buffer;
      await file.writeAsBytes(
        buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes),
      );
    }

    return NativeDatabase(file);
  });
  return AppDatabase(db);
}
