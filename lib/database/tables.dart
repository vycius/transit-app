// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

class Stops extends Table {
  TextColumn get stop_id => text()();

  TextColumn get stop_code => text().nullable()();

  TextColumn get stop_name => text()();

  TextColumn get stop_desc => text().nullable()();

  RealColumn get stop_lat => real()();

  RealColumn get stop_lon => real()();

  TextColumn get zone_id => text().nullable()();

  TextColumn get stop_url => text().nullable()();

  IntColumn get location_type => integer().nullable()();

  TextColumn get parent_station => text().nullable()();

  TextColumn get stop_timezone => text().nullable()();

  IntColumn get wheelchair_boarding => integer().nullable()();

  TextColumn get level_id => text().nullable()();

  TextColumn get platform_code => text().nullable()();

  @override
  Set<Column> get primaryKey => {stop_id};
}

class TransitRoutes extends Table {
  TextColumn get route_id => text()();

  TextColumn get agency_id => text().nullable()();

  TextColumn get route_short_name => text().nullable()();

  TextColumn get route_long_name => text()();

  TextColumn get route_desc => text().nullable()();

  IntColumn get route_type => integer()();

  TextColumn get route_url => text().nullable()();

  TextColumn get route_color => text().nullable()();

  TextColumn get route_text_color => text().nullable()();

  IntColumn get route_sort_order => integer().nullable()();

  @override
  Set<Column> get primaryKey => {route_id};
}

class Calendar extends Table {
  TextColumn get service_id => text()();

  BoolColumn get monday => boolean()();

  BoolColumn get tuesday => boolean()();

  BoolColumn get wednesday => boolean()();

  BoolColumn get thursday => boolean()();

  BoolColumn get friday => boolean()();

  BoolColumn get saturday => boolean()();

  BoolColumn get sunday => boolean()();

  TextColumn get start_date => text()();

  TextColumn get end_date => text()();

  @override
  Set<Column> get primaryKey => {service_id};
}

class Trips extends Table {
  TextColumn get route_id => text().references(TransitRoutes, #route_id)();

  TextColumn get service_id => text().references(Calendar, #service_id)();

  TextColumn get trip_id => text()();

  TextColumn get trip_headsign => text().nullable()();

  TextColumn get trip_short_name => text().nullable()();

  IntColumn get direction_id => integer().nullable()();

  TextColumn get block_id => text().nullable()();

  TextColumn get shape_id => text().nullable().references(Shapes, #shape_id)();

  IntColumn get wheelchair_accessible => integer().nullable()();

  IntColumn get bikes_allowed => integer().nullable()();

  @override
  Set<Column> get primaryKey => {trip_id};
}

class StopTimes extends Table {
  TextColumn get trip_id => text().references(Trips, #trip_id)();

  TextColumn get arrival_time => text()();

  TextColumn get departure_time => text()();

  TextColumn get stop_id => text().references(Stops, #stop_id)();

  IntColumn get stop_sequence => integer()();

  TextColumn get stop_headsign => text().nullable()();

  IntColumn get pickup_type => integer().nullable()();

  IntColumn get drop_off_type => integer().nullable()();

  IntColumn get continuous_pickup => integer().nullable()();

  IntColumn get continuous_drop_off => integer().nullable()();

  RealColumn get shape_dist_traveled => real().nullable()();

  IntColumn get timepoint => integer().nullable()();

  @override
  Set<Column> get primaryKey => {trip_id, stop_id, stop_sequence};
}

class Shapes extends Table {
  TextColumn get shape_id => text()();

  RealColumn get shape_pt_lat => real()();

  RealColumn get shape_pt_lon => real()();

  IntColumn get shape_pt_sequence => integer()();

  RealColumn get shape_dist_traveled => real().nullable()();

  @override
  Set<Column> get primaryKey => {shape_id, shape_pt_sequence};
}

class CalendarDates extends Table {
  TextColumn get service_id => text().references(Calendar, #service_id)();

  TextColumn get date => text()();

  IntColumn get exception_type => integer()();

  @override
  Set<Column> get primaryKey => {service_id, date};
}
