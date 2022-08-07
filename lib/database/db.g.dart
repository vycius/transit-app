// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Stop extends DataClass implements Insertable<Stop> {
  final String stop_id;
  final String? stop_code;
  final String stop_name;
  final String? stop_desc;
  final double stop_lat;
  final double stop_lon;
  final String? zone_id;
  final String? stop_url;
  final int? location_type;
  final String? parent_station;
  final String? stop_timezone;
  final int? wheelchair_boarding;
  final String? level_id;
  final String? platform_code;
  Stop(
      {required this.stop_id,
      this.stop_code,
      required this.stop_name,
      this.stop_desc,
      required this.stop_lat,
      required this.stop_lon,
      this.zone_id,
      this.stop_url,
      this.location_type,
      this.parent_station,
      this.stop_timezone,
      this.wheelchair_boarding,
      this.level_id,
      this.platform_code});
  factory Stop.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Stop(
      stop_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_id'])!,
      stop_code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_code']),
      stop_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_name'])!,
      stop_desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_desc']),
      stop_lat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_lat'])!,
      stop_lon: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_lon'])!,
      zone_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}zone_id']),
      stop_url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_url']),
      location_type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location_type']),
      parent_station: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_station']),
      stop_timezone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_timezone']),
      wheelchair_boarding: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}wheelchair_boarding']),
      level_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}level_id']),
      platform_code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}platform_code']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['stop_id'] = Variable<String>(stop_id);
    if (!nullToAbsent || stop_code != null) {
      map['stop_code'] = Variable<String?>(stop_code);
    }
    map['stop_name'] = Variable<String>(stop_name);
    if (!nullToAbsent || stop_desc != null) {
      map['stop_desc'] = Variable<String?>(stop_desc);
    }
    map['stop_lat'] = Variable<double>(stop_lat);
    map['stop_lon'] = Variable<double>(stop_lon);
    if (!nullToAbsent || zone_id != null) {
      map['zone_id'] = Variable<String?>(zone_id);
    }
    if (!nullToAbsent || stop_url != null) {
      map['stop_url'] = Variable<String?>(stop_url);
    }
    if (!nullToAbsent || location_type != null) {
      map['location_type'] = Variable<int?>(location_type);
    }
    if (!nullToAbsent || parent_station != null) {
      map['parent_station'] = Variable<String?>(parent_station);
    }
    if (!nullToAbsent || stop_timezone != null) {
      map['stop_timezone'] = Variable<String?>(stop_timezone);
    }
    if (!nullToAbsent || wheelchair_boarding != null) {
      map['wheelchair_boarding'] = Variable<int?>(wheelchair_boarding);
    }
    if (!nullToAbsent || level_id != null) {
      map['level_id'] = Variable<String?>(level_id);
    }
    if (!nullToAbsent || platform_code != null) {
      map['platform_code'] = Variable<String?>(platform_code);
    }
    return map;
  }

  StopsCompanion toCompanion(bool nullToAbsent) {
    return StopsCompanion(
      stop_id: Value(stop_id),
      stop_code: stop_code == null && nullToAbsent
          ? const Value.absent()
          : Value(stop_code),
      stop_name: Value(stop_name),
      stop_desc: stop_desc == null && nullToAbsent
          ? const Value.absent()
          : Value(stop_desc),
      stop_lat: Value(stop_lat),
      stop_lon: Value(stop_lon),
      zone_id: zone_id == null && nullToAbsent
          ? const Value.absent()
          : Value(zone_id),
      stop_url: stop_url == null && nullToAbsent
          ? const Value.absent()
          : Value(stop_url),
      location_type: location_type == null && nullToAbsent
          ? const Value.absent()
          : Value(location_type),
      parent_station: parent_station == null && nullToAbsent
          ? const Value.absent()
          : Value(parent_station),
      stop_timezone: stop_timezone == null && nullToAbsent
          ? const Value.absent()
          : Value(stop_timezone),
      wheelchair_boarding: wheelchair_boarding == null && nullToAbsent
          ? const Value.absent()
          : Value(wheelchair_boarding),
      level_id: level_id == null && nullToAbsent
          ? const Value.absent()
          : Value(level_id),
      platform_code: platform_code == null && nullToAbsent
          ? const Value.absent()
          : Value(platform_code),
    );
  }

  factory Stop.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stop(
      stop_id: serializer.fromJson<String>(json['stop_id']),
      stop_code: serializer.fromJson<String?>(json['stop_code']),
      stop_name: serializer.fromJson<String>(json['stop_name']),
      stop_desc: serializer.fromJson<String?>(json['stop_desc']),
      stop_lat: serializer.fromJson<double>(json['stop_lat']),
      stop_lon: serializer.fromJson<double>(json['stop_lon']),
      zone_id: serializer.fromJson<String?>(json['zone_id']),
      stop_url: serializer.fromJson<String?>(json['stop_url']),
      location_type: serializer.fromJson<int?>(json['location_type']),
      parent_station: serializer.fromJson<String?>(json['parent_station']),
      stop_timezone: serializer.fromJson<String?>(json['stop_timezone']),
      wheelchair_boarding:
          serializer.fromJson<int?>(json['wheelchair_boarding']),
      level_id: serializer.fromJson<String?>(json['level_id']),
      platform_code: serializer.fromJson<String?>(json['platform_code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'stop_id': serializer.toJson<String>(stop_id),
      'stop_code': serializer.toJson<String?>(stop_code),
      'stop_name': serializer.toJson<String>(stop_name),
      'stop_desc': serializer.toJson<String?>(stop_desc),
      'stop_lat': serializer.toJson<double>(stop_lat),
      'stop_lon': serializer.toJson<double>(stop_lon),
      'zone_id': serializer.toJson<String?>(zone_id),
      'stop_url': serializer.toJson<String?>(stop_url),
      'location_type': serializer.toJson<int?>(location_type),
      'parent_station': serializer.toJson<String?>(parent_station),
      'stop_timezone': serializer.toJson<String?>(stop_timezone),
      'wheelchair_boarding': serializer.toJson<int?>(wheelchair_boarding),
      'level_id': serializer.toJson<String?>(level_id),
      'platform_code': serializer.toJson<String?>(platform_code),
    };
  }

  Stop copyWith(
          {String? stop_id,
          String? stop_code,
          String? stop_name,
          String? stop_desc,
          double? stop_lat,
          double? stop_lon,
          String? zone_id,
          String? stop_url,
          int? location_type,
          String? parent_station,
          String? stop_timezone,
          int? wheelchair_boarding,
          String? level_id,
          String? platform_code}) =>
      Stop(
        stop_id: stop_id ?? this.stop_id,
        stop_code: stop_code ?? this.stop_code,
        stop_name: stop_name ?? this.stop_name,
        stop_desc: stop_desc ?? this.stop_desc,
        stop_lat: stop_lat ?? this.stop_lat,
        stop_lon: stop_lon ?? this.stop_lon,
        zone_id: zone_id ?? this.zone_id,
        stop_url: stop_url ?? this.stop_url,
        location_type: location_type ?? this.location_type,
        parent_station: parent_station ?? this.parent_station,
        stop_timezone: stop_timezone ?? this.stop_timezone,
        wheelchair_boarding: wheelchair_boarding ?? this.wheelchair_boarding,
        level_id: level_id ?? this.level_id,
        platform_code: platform_code ?? this.platform_code,
      );
  @override
  String toString() {
    return (StringBuffer('Stop(')
          ..write('stop_id: $stop_id, ')
          ..write('stop_code: $stop_code, ')
          ..write('stop_name: $stop_name, ')
          ..write('stop_desc: $stop_desc, ')
          ..write('stop_lat: $stop_lat, ')
          ..write('stop_lon: $stop_lon, ')
          ..write('zone_id: $zone_id, ')
          ..write('stop_url: $stop_url, ')
          ..write('location_type: $location_type, ')
          ..write('parent_station: $parent_station, ')
          ..write('stop_timezone: $stop_timezone, ')
          ..write('wheelchair_boarding: $wheelchair_boarding, ')
          ..write('level_id: $level_id, ')
          ..write('platform_code: $platform_code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      stop_id,
      stop_code,
      stop_name,
      stop_desc,
      stop_lat,
      stop_lon,
      zone_id,
      stop_url,
      location_type,
      parent_station,
      stop_timezone,
      wheelchair_boarding,
      level_id,
      platform_code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stop &&
          other.stop_id == this.stop_id &&
          other.stop_code == this.stop_code &&
          other.stop_name == this.stop_name &&
          other.stop_desc == this.stop_desc &&
          other.stop_lat == this.stop_lat &&
          other.stop_lon == this.stop_lon &&
          other.zone_id == this.zone_id &&
          other.stop_url == this.stop_url &&
          other.location_type == this.location_type &&
          other.parent_station == this.parent_station &&
          other.stop_timezone == this.stop_timezone &&
          other.wheelchair_boarding == this.wheelchair_boarding &&
          other.level_id == this.level_id &&
          other.platform_code == this.platform_code);
}

class StopsCompanion extends UpdateCompanion<Stop> {
  final Value<String> stop_id;
  final Value<String?> stop_code;
  final Value<String> stop_name;
  final Value<String?> stop_desc;
  final Value<double> stop_lat;
  final Value<double> stop_lon;
  final Value<String?> zone_id;
  final Value<String?> stop_url;
  final Value<int?> location_type;
  final Value<String?> parent_station;
  final Value<String?> stop_timezone;
  final Value<int?> wheelchair_boarding;
  final Value<String?> level_id;
  final Value<String?> platform_code;
  const StopsCompanion({
    this.stop_id = const Value.absent(),
    this.stop_code = const Value.absent(),
    this.stop_name = const Value.absent(),
    this.stop_desc = const Value.absent(),
    this.stop_lat = const Value.absent(),
    this.stop_lon = const Value.absent(),
    this.zone_id = const Value.absent(),
    this.stop_url = const Value.absent(),
    this.location_type = const Value.absent(),
    this.parent_station = const Value.absent(),
    this.stop_timezone = const Value.absent(),
    this.wheelchair_boarding = const Value.absent(),
    this.level_id = const Value.absent(),
    this.platform_code = const Value.absent(),
  });
  StopsCompanion.insert({
    required String stop_id,
    this.stop_code = const Value.absent(),
    required String stop_name,
    this.stop_desc = const Value.absent(),
    required double stop_lat,
    required double stop_lon,
    this.zone_id = const Value.absent(),
    this.stop_url = const Value.absent(),
    this.location_type = const Value.absent(),
    this.parent_station = const Value.absent(),
    this.stop_timezone = const Value.absent(),
    this.wheelchair_boarding = const Value.absent(),
    this.level_id = const Value.absent(),
    this.platform_code = const Value.absent(),
  })  : stop_id = Value(stop_id),
        stop_name = Value(stop_name),
        stop_lat = Value(stop_lat),
        stop_lon = Value(stop_lon);
  static Insertable<Stop> custom({
    Expression<String>? stop_id,
    Expression<String?>? stop_code,
    Expression<String>? stop_name,
    Expression<String?>? stop_desc,
    Expression<double>? stop_lat,
    Expression<double>? stop_lon,
    Expression<String?>? zone_id,
    Expression<String?>? stop_url,
    Expression<int?>? location_type,
    Expression<String?>? parent_station,
    Expression<String?>? stop_timezone,
    Expression<int?>? wheelchair_boarding,
    Expression<String?>? level_id,
    Expression<String?>? platform_code,
  }) {
    return RawValuesInsertable({
      if (stop_id != null) 'stop_id': stop_id,
      if (stop_code != null) 'stop_code': stop_code,
      if (stop_name != null) 'stop_name': stop_name,
      if (stop_desc != null) 'stop_desc': stop_desc,
      if (stop_lat != null) 'stop_lat': stop_lat,
      if (stop_lon != null) 'stop_lon': stop_lon,
      if (zone_id != null) 'zone_id': zone_id,
      if (stop_url != null) 'stop_url': stop_url,
      if (location_type != null) 'location_type': location_type,
      if (parent_station != null) 'parent_station': parent_station,
      if (stop_timezone != null) 'stop_timezone': stop_timezone,
      if (wheelchair_boarding != null)
        'wheelchair_boarding': wheelchair_boarding,
      if (level_id != null) 'level_id': level_id,
      if (platform_code != null) 'platform_code': platform_code,
    });
  }

  StopsCompanion copyWith(
      {Value<String>? stop_id,
      Value<String?>? stop_code,
      Value<String>? stop_name,
      Value<String?>? stop_desc,
      Value<double>? stop_lat,
      Value<double>? stop_lon,
      Value<String?>? zone_id,
      Value<String?>? stop_url,
      Value<int?>? location_type,
      Value<String?>? parent_station,
      Value<String?>? stop_timezone,
      Value<int?>? wheelchair_boarding,
      Value<String?>? level_id,
      Value<String?>? platform_code}) {
    return StopsCompanion(
      stop_id: stop_id ?? this.stop_id,
      stop_code: stop_code ?? this.stop_code,
      stop_name: stop_name ?? this.stop_name,
      stop_desc: stop_desc ?? this.stop_desc,
      stop_lat: stop_lat ?? this.stop_lat,
      stop_lon: stop_lon ?? this.stop_lon,
      zone_id: zone_id ?? this.zone_id,
      stop_url: stop_url ?? this.stop_url,
      location_type: location_type ?? this.location_type,
      parent_station: parent_station ?? this.parent_station,
      stop_timezone: stop_timezone ?? this.stop_timezone,
      wheelchair_boarding: wheelchair_boarding ?? this.wheelchair_boarding,
      level_id: level_id ?? this.level_id,
      platform_code: platform_code ?? this.platform_code,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (stop_id.present) {
      map['stop_id'] = Variable<String>(stop_id.value);
    }
    if (stop_code.present) {
      map['stop_code'] = Variable<String?>(stop_code.value);
    }
    if (stop_name.present) {
      map['stop_name'] = Variable<String>(stop_name.value);
    }
    if (stop_desc.present) {
      map['stop_desc'] = Variable<String?>(stop_desc.value);
    }
    if (stop_lat.present) {
      map['stop_lat'] = Variable<double>(stop_lat.value);
    }
    if (stop_lon.present) {
      map['stop_lon'] = Variable<double>(stop_lon.value);
    }
    if (zone_id.present) {
      map['zone_id'] = Variable<String?>(zone_id.value);
    }
    if (stop_url.present) {
      map['stop_url'] = Variable<String?>(stop_url.value);
    }
    if (location_type.present) {
      map['location_type'] = Variable<int?>(location_type.value);
    }
    if (parent_station.present) {
      map['parent_station'] = Variable<String?>(parent_station.value);
    }
    if (stop_timezone.present) {
      map['stop_timezone'] = Variable<String?>(stop_timezone.value);
    }
    if (wheelchair_boarding.present) {
      map['wheelchair_boarding'] = Variable<int?>(wheelchair_boarding.value);
    }
    if (level_id.present) {
      map['level_id'] = Variable<String?>(level_id.value);
    }
    if (platform_code.present) {
      map['platform_code'] = Variable<String?>(platform_code.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StopsCompanion(')
          ..write('stop_id: $stop_id, ')
          ..write('stop_code: $stop_code, ')
          ..write('stop_name: $stop_name, ')
          ..write('stop_desc: $stop_desc, ')
          ..write('stop_lat: $stop_lat, ')
          ..write('stop_lon: $stop_lon, ')
          ..write('zone_id: $zone_id, ')
          ..write('stop_url: $stop_url, ')
          ..write('location_type: $location_type, ')
          ..write('parent_station: $parent_station, ')
          ..write('stop_timezone: $stop_timezone, ')
          ..write('wheelchair_boarding: $wheelchair_boarding, ')
          ..write('level_id: $level_id, ')
          ..write('platform_code: $platform_code')
          ..write(')'))
        .toString();
  }
}

class $StopsTable extends Stops with TableInfo<$StopsTable, Stop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StopsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _stop_idMeta = const VerificationMeta('stop_id');
  @override
  late final GeneratedColumn<String?> stop_id = GeneratedColumn<String?>(
      'stop_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stop_codeMeta = const VerificationMeta('stop_code');
  @override
  late final GeneratedColumn<String?> stop_code = GeneratedColumn<String?>(
      'stop_code', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _stop_nameMeta = const VerificationMeta('stop_name');
  @override
  late final GeneratedColumn<String?> stop_name = GeneratedColumn<String?>(
      'stop_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stop_descMeta = const VerificationMeta('stop_desc');
  @override
  late final GeneratedColumn<String?> stop_desc = GeneratedColumn<String?>(
      'stop_desc', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _stop_latMeta = const VerificationMeta('stop_lat');
  @override
  late final GeneratedColumn<double?> stop_lat = GeneratedColumn<double?>(
      'stop_lat', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _stop_lonMeta = const VerificationMeta('stop_lon');
  @override
  late final GeneratedColumn<double?> stop_lon = GeneratedColumn<double?>(
      'stop_lon', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _zone_idMeta = const VerificationMeta('zone_id');
  @override
  late final GeneratedColumn<String?> zone_id = GeneratedColumn<String?>(
      'zone_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _stop_urlMeta = const VerificationMeta('stop_url');
  @override
  late final GeneratedColumn<String?> stop_url = GeneratedColumn<String?>(
      'stop_url', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _location_typeMeta =
      const VerificationMeta('location_type');
  @override
  late final GeneratedColumn<int?> location_type = GeneratedColumn<int?>(
      'location_type', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _parent_stationMeta =
      const VerificationMeta('parent_station');
  @override
  late final GeneratedColumn<String?> parent_station = GeneratedColumn<String?>(
      'parent_station', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _stop_timezoneMeta =
      const VerificationMeta('stop_timezone');
  @override
  late final GeneratedColumn<String?> stop_timezone = GeneratedColumn<String?>(
      'stop_timezone', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _wheelchair_boardingMeta =
      const VerificationMeta('wheelchair_boarding');
  @override
  late final GeneratedColumn<int?> wheelchair_boarding = GeneratedColumn<int?>(
      'wheelchair_boarding', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _level_idMeta = const VerificationMeta('level_id');
  @override
  late final GeneratedColumn<String?> level_id = GeneratedColumn<String?>(
      'level_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _platform_codeMeta =
      const VerificationMeta('platform_code');
  @override
  late final GeneratedColumn<String?> platform_code = GeneratedColumn<String?>(
      'platform_code', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        stop_id,
        stop_code,
        stop_name,
        stop_desc,
        stop_lat,
        stop_lon,
        zone_id,
        stop_url,
        location_type,
        parent_station,
        stop_timezone,
        wheelchair_boarding,
        level_id,
        platform_code
      ];
  @override
  String get aliasedName => _alias ?? 'stops';
  @override
  String get actualTableName => 'stops';
  @override
  VerificationContext validateIntegrity(Insertable<Stop> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('stop_id')) {
      context.handle(_stop_idMeta,
          stop_id.isAcceptableOrUnknown(data['stop_id']!, _stop_idMeta));
    } else if (isInserting) {
      context.missing(_stop_idMeta);
    }
    if (data.containsKey('stop_code')) {
      context.handle(_stop_codeMeta,
          stop_code.isAcceptableOrUnknown(data['stop_code']!, _stop_codeMeta));
    }
    if (data.containsKey('stop_name')) {
      context.handle(_stop_nameMeta,
          stop_name.isAcceptableOrUnknown(data['stop_name']!, _stop_nameMeta));
    } else if (isInserting) {
      context.missing(_stop_nameMeta);
    }
    if (data.containsKey('stop_desc')) {
      context.handle(_stop_descMeta,
          stop_desc.isAcceptableOrUnknown(data['stop_desc']!, _stop_descMeta));
    }
    if (data.containsKey('stop_lat')) {
      context.handle(_stop_latMeta,
          stop_lat.isAcceptableOrUnknown(data['stop_lat']!, _stop_latMeta));
    } else if (isInserting) {
      context.missing(_stop_latMeta);
    }
    if (data.containsKey('stop_lon')) {
      context.handle(_stop_lonMeta,
          stop_lon.isAcceptableOrUnknown(data['stop_lon']!, _stop_lonMeta));
    } else if (isInserting) {
      context.missing(_stop_lonMeta);
    }
    if (data.containsKey('zone_id')) {
      context.handle(_zone_idMeta,
          zone_id.isAcceptableOrUnknown(data['zone_id']!, _zone_idMeta));
    }
    if (data.containsKey('stop_url')) {
      context.handle(_stop_urlMeta,
          stop_url.isAcceptableOrUnknown(data['stop_url']!, _stop_urlMeta));
    }
    if (data.containsKey('location_type')) {
      context.handle(
          _location_typeMeta,
          location_type.isAcceptableOrUnknown(
              data['location_type']!, _location_typeMeta));
    }
    if (data.containsKey('parent_station')) {
      context.handle(
          _parent_stationMeta,
          parent_station.isAcceptableOrUnknown(
              data['parent_station']!, _parent_stationMeta));
    }
    if (data.containsKey('stop_timezone')) {
      context.handle(
          _stop_timezoneMeta,
          stop_timezone.isAcceptableOrUnknown(
              data['stop_timezone']!, _stop_timezoneMeta));
    }
    if (data.containsKey('wheelchair_boarding')) {
      context.handle(
          _wheelchair_boardingMeta,
          wheelchair_boarding.isAcceptableOrUnknown(
              data['wheelchair_boarding']!, _wheelchair_boardingMeta));
    }
    if (data.containsKey('level_id')) {
      context.handle(_level_idMeta,
          level_id.isAcceptableOrUnknown(data['level_id']!, _level_idMeta));
    }
    if (data.containsKey('platform_code')) {
      context.handle(
          _platform_codeMeta,
          platform_code.isAcceptableOrUnknown(
              data['platform_code']!, _platform_codeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {stop_id};
  @override
  Stop map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Stop.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $StopsTable createAlias(String alias) {
    return $StopsTable(attachedDatabase, alias);
  }
}

class TransitRoute extends DataClass implements Insertable<TransitRoute> {
  final String route_id;
  final String? agency_id;
  final String? route_short_name;
  final String route_long_name;
  final String? route_desc;
  final int route_type;
  final String? route_url;
  final String? route_color;
  final String? route_text_color;
  final int? route_sort_order;
  TransitRoute(
      {required this.route_id,
      this.agency_id,
      this.route_short_name,
      required this.route_long_name,
      this.route_desc,
      required this.route_type,
      this.route_url,
      this.route_color,
      this.route_text_color,
      this.route_sort_order});
  factory TransitRoute.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TransitRoute(
      route_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_id'])!,
      agency_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}agency_id']),
      route_short_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_short_name']),
      route_long_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_long_name'])!,
      route_desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_desc']),
      route_type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_type'])!,
      route_url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_url']),
      route_color: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_color']),
      route_text_color: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_text_color']),
      route_sort_order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_sort_order']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['route_id'] = Variable<String>(route_id);
    if (!nullToAbsent || agency_id != null) {
      map['agency_id'] = Variable<String?>(agency_id);
    }
    if (!nullToAbsent || route_short_name != null) {
      map['route_short_name'] = Variable<String?>(route_short_name);
    }
    map['route_long_name'] = Variable<String>(route_long_name);
    if (!nullToAbsent || route_desc != null) {
      map['route_desc'] = Variable<String?>(route_desc);
    }
    map['route_type'] = Variable<int>(route_type);
    if (!nullToAbsent || route_url != null) {
      map['route_url'] = Variable<String?>(route_url);
    }
    if (!nullToAbsent || route_color != null) {
      map['route_color'] = Variable<String?>(route_color);
    }
    if (!nullToAbsent || route_text_color != null) {
      map['route_text_color'] = Variable<String?>(route_text_color);
    }
    if (!nullToAbsent || route_sort_order != null) {
      map['route_sort_order'] = Variable<int?>(route_sort_order);
    }
    return map;
  }

  TransitRoutesCompanion toCompanion(bool nullToAbsent) {
    return TransitRoutesCompanion(
      route_id: Value(route_id),
      agency_id: agency_id == null && nullToAbsent
          ? const Value.absent()
          : Value(agency_id),
      route_short_name: route_short_name == null && nullToAbsent
          ? const Value.absent()
          : Value(route_short_name),
      route_long_name: Value(route_long_name),
      route_desc: route_desc == null && nullToAbsent
          ? const Value.absent()
          : Value(route_desc),
      route_type: Value(route_type),
      route_url: route_url == null && nullToAbsent
          ? const Value.absent()
          : Value(route_url),
      route_color: route_color == null && nullToAbsent
          ? const Value.absent()
          : Value(route_color),
      route_text_color: route_text_color == null && nullToAbsent
          ? const Value.absent()
          : Value(route_text_color),
      route_sort_order: route_sort_order == null && nullToAbsent
          ? const Value.absent()
          : Value(route_sort_order),
    );
  }

  factory TransitRoute.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransitRoute(
      route_id: serializer.fromJson<String>(json['route_id']),
      agency_id: serializer.fromJson<String?>(json['agency_id']),
      route_short_name: serializer.fromJson<String?>(json['route_short_name']),
      route_long_name: serializer.fromJson<String>(json['route_long_name']),
      route_desc: serializer.fromJson<String?>(json['route_desc']),
      route_type: serializer.fromJson<int>(json['route_type']),
      route_url: serializer.fromJson<String?>(json['route_url']),
      route_color: serializer.fromJson<String?>(json['route_color']),
      route_text_color: serializer.fromJson<String?>(json['route_text_color']),
      route_sort_order: serializer.fromJson<int?>(json['route_sort_order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'route_id': serializer.toJson<String>(route_id),
      'agency_id': serializer.toJson<String?>(agency_id),
      'route_short_name': serializer.toJson<String?>(route_short_name),
      'route_long_name': serializer.toJson<String>(route_long_name),
      'route_desc': serializer.toJson<String?>(route_desc),
      'route_type': serializer.toJson<int>(route_type),
      'route_url': serializer.toJson<String?>(route_url),
      'route_color': serializer.toJson<String?>(route_color),
      'route_text_color': serializer.toJson<String?>(route_text_color),
      'route_sort_order': serializer.toJson<int?>(route_sort_order),
    };
  }

  TransitRoute copyWith(
          {String? route_id,
          String? agency_id,
          String? route_short_name,
          String? route_long_name,
          String? route_desc,
          int? route_type,
          String? route_url,
          String? route_color,
          String? route_text_color,
          int? route_sort_order}) =>
      TransitRoute(
        route_id: route_id ?? this.route_id,
        agency_id: agency_id ?? this.agency_id,
        route_short_name: route_short_name ?? this.route_short_name,
        route_long_name: route_long_name ?? this.route_long_name,
        route_desc: route_desc ?? this.route_desc,
        route_type: route_type ?? this.route_type,
        route_url: route_url ?? this.route_url,
        route_color: route_color ?? this.route_color,
        route_text_color: route_text_color ?? this.route_text_color,
        route_sort_order: route_sort_order ?? this.route_sort_order,
      );
  @override
  String toString() {
    return (StringBuffer('TransitRoute(')
          ..write('route_id: $route_id, ')
          ..write('agency_id: $agency_id, ')
          ..write('route_short_name: $route_short_name, ')
          ..write('route_long_name: $route_long_name, ')
          ..write('route_desc: $route_desc, ')
          ..write('route_type: $route_type, ')
          ..write('route_url: $route_url, ')
          ..write('route_color: $route_color, ')
          ..write('route_text_color: $route_text_color, ')
          ..write('route_sort_order: $route_sort_order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      route_id,
      agency_id,
      route_short_name,
      route_long_name,
      route_desc,
      route_type,
      route_url,
      route_color,
      route_text_color,
      route_sort_order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransitRoute &&
          other.route_id == this.route_id &&
          other.agency_id == this.agency_id &&
          other.route_short_name == this.route_short_name &&
          other.route_long_name == this.route_long_name &&
          other.route_desc == this.route_desc &&
          other.route_type == this.route_type &&
          other.route_url == this.route_url &&
          other.route_color == this.route_color &&
          other.route_text_color == this.route_text_color &&
          other.route_sort_order == this.route_sort_order);
}

class TransitRoutesCompanion extends UpdateCompanion<TransitRoute> {
  final Value<String> route_id;
  final Value<String?> agency_id;
  final Value<String?> route_short_name;
  final Value<String> route_long_name;
  final Value<String?> route_desc;
  final Value<int> route_type;
  final Value<String?> route_url;
  final Value<String?> route_color;
  final Value<String?> route_text_color;
  final Value<int?> route_sort_order;
  const TransitRoutesCompanion({
    this.route_id = const Value.absent(),
    this.agency_id = const Value.absent(),
    this.route_short_name = const Value.absent(),
    this.route_long_name = const Value.absent(),
    this.route_desc = const Value.absent(),
    this.route_type = const Value.absent(),
    this.route_url = const Value.absent(),
    this.route_color = const Value.absent(),
    this.route_text_color = const Value.absent(),
    this.route_sort_order = const Value.absent(),
  });
  TransitRoutesCompanion.insert({
    required String route_id,
    this.agency_id = const Value.absent(),
    this.route_short_name = const Value.absent(),
    required String route_long_name,
    this.route_desc = const Value.absent(),
    required int route_type,
    this.route_url = const Value.absent(),
    this.route_color = const Value.absent(),
    this.route_text_color = const Value.absent(),
    this.route_sort_order = const Value.absent(),
  })  : route_id = Value(route_id),
        route_long_name = Value(route_long_name),
        route_type = Value(route_type);
  static Insertable<TransitRoute> custom({
    Expression<String>? route_id,
    Expression<String?>? agency_id,
    Expression<String?>? route_short_name,
    Expression<String>? route_long_name,
    Expression<String?>? route_desc,
    Expression<int>? route_type,
    Expression<String?>? route_url,
    Expression<String?>? route_color,
    Expression<String?>? route_text_color,
    Expression<int?>? route_sort_order,
  }) {
    return RawValuesInsertable({
      if (route_id != null) 'route_id': route_id,
      if (agency_id != null) 'agency_id': agency_id,
      if (route_short_name != null) 'route_short_name': route_short_name,
      if (route_long_name != null) 'route_long_name': route_long_name,
      if (route_desc != null) 'route_desc': route_desc,
      if (route_type != null) 'route_type': route_type,
      if (route_url != null) 'route_url': route_url,
      if (route_color != null) 'route_color': route_color,
      if (route_text_color != null) 'route_text_color': route_text_color,
      if (route_sort_order != null) 'route_sort_order': route_sort_order,
    });
  }

  TransitRoutesCompanion copyWith(
      {Value<String>? route_id,
      Value<String?>? agency_id,
      Value<String?>? route_short_name,
      Value<String>? route_long_name,
      Value<String?>? route_desc,
      Value<int>? route_type,
      Value<String?>? route_url,
      Value<String?>? route_color,
      Value<String?>? route_text_color,
      Value<int?>? route_sort_order}) {
    return TransitRoutesCompanion(
      route_id: route_id ?? this.route_id,
      agency_id: agency_id ?? this.agency_id,
      route_short_name: route_short_name ?? this.route_short_name,
      route_long_name: route_long_name ?? this.route_long_name,
      route_desc: route_desc ?? this.route_desc,
      route_type: route_type ?? this.route_type,
      route_url: route_url ?? this.route_url,
      route_color: route_color ?? this.route_color,
      route_text_color: route_text_color ?? this.route_text_color,
      route_sort_order: route_sort_order ?? this.route_sort_order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (route_id.present) {
      map['route_id'] = Variable<String>(route_id.value);
    }
    if (agency_id.present) {
      map['agency_id'] = Variable<String?>(agency_id.value);
    }
    if (route_short_name.present) {
      map['route_short_name'] = Variable<String?>(route_short_name.value);
    }
    if (route_long_name.present) {
      map['route_long_name'] = Variable<String>(route_long_name.value);
    }
    if (route_desc.present) {
      map['route_desc'] = Variable<String?>(route_desc.value);
    }
    if (route_type.present) {
      map['route_type'] = Variable<int>(route_type.value);
    }
    if (route_url.present) {
      map['route_url'] = Variable<String?>(route_url.value);
    }
    if (route_color.present) {
      map['route_color'] = Variable<String?>(route_color.value);
    }
    if (route_text_color.present) {
      map['route_text_color'] = Variable<String?>(route_text_color.value);
    }
    if (route_sort_order.present) {
      map['route_sort_order'] = Variable<int?>(route_sort_order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransitRoutesCompanion(')
          ..write('route_id: $route_id, ')
          ..write('agency_id: $agency_id, ')
          ..write('route_short_name: $route_short_name, ')
          ..write('route_long_name: $route_long_name, ')
          ..write('route_desc: $route_desc, ')
          ..write('route_type: $route_type, ')
          ..write('route_url: $route_url, ')
          ..write('route_color: $route_color, ')
          ..write('route_text_color: $route_text_color, ')
          ..write('route_sort_order: $route_sort_order')
          ..write(')'))
        .toString();
  }
}

class $TransitRoutesTable extends TransitRoutes
    with TableInfo<$TransitRoutesTable, TransitRoute> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransitRoutesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _route_idMeta = const VerificationMeta('route_id');
  @override
  late final GeneratedColumn<String?> route_id = GeneratedColumn<String?>(
      'route_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _agency_idMeta = const VerificationMeta('agency_id');
  @override
  late final GeneratedColumn<String?> agency_id = GeneratedColumn<String?>(
      'agency_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _route_short_nameMeta =
      const VerificationMeta('route_short_name');
  @override
  late final GeneratedColumn<String?> route_short_name =
      GeneratedColumn<String?>('route_short_name', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _route_long_nameMeta =
      const VerificationMeta('route_long_name');
  @override
  late final GeneratedColumn<String?> route_long_name =
      GeneratedColumn<String?>('route_long_name', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _route_descMeta = const VerificationMeta('route_desc');
  @override
  late final GeneratedColumn<String?> route_desc = GeneratedColumn<String?>(
      'route_desc', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _route_typeMeta = const VerificationMeta('route_type');
  @override
  late final GeneratedColumn<int?> route_type = GeneratedColumn<int?>(
      'route_type', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _route_urlMeta = const VerificationMeta('route_url');
  @override
  late final GeneratedColumn<String?> route_url = GeneratedColumn<String?>(
      'route_url', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _route_colorMeta =
      const VerificationMeta('route_color');
  @override
  late final GeneratedColumn<String?> route_color = GeneratedColumn<String?>(
      'route_color', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _route_text_colorMeta =
      const VerificationMeta('route_text_color');
  @override
  late final GeneratedColumn<String?> route_text_color =
      GeneratedColumn<String?>('route_text_color', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _route_sort_orderMeta =
      const VerificationMeta('route_sort_order');
  @override
  late final GeneratedColumn<int?> route_sort_order = GeneratedColumn<int?>(
      'route_sort_order', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        route_id,
        agency_id,
        route_short_name,
        route_long_name,
        route_desc,
        route_type,
        route_url,
        route_color,
        route_text_color,
        route_sort_order
      ];
  @override
  String get aliasedName => _alias ?? 'transit_routes';
  @override
  String get actualTableName => 'transit_routes';
  @override
  VerificationContext validateIntegrity(Insertable<TransitRoute> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('route_id')) {
      context.handle(_route_idMeta,
          route_id.isAcceptableOrUnknown(data['route_id']!, _route_idMeta));
    } else if (isInserting) {
      context.missing(_route_idMeta);
    }
    if (data.containsKey('agency_id')) {
      context.handle(_agency_idMeta,
          agency_id.isAcceptableOrUnknown(data['agency_id']!, _agency_idMeta));
    }
    if (data.containsKey('route_short_name')) {
      context.handle(
          _route_short_nameMeta,
          route_short_name.isAcceptableOrUnknown(
              data['route_short_name']!, _route_short_nameMeta));
    }
    if (data.containsKey('route_long_name')) {
      context.handle(
          _route_long_nameMeta,
          route_long_name.isAcceptableOrUnknown(
              data['route_long_name']!, _route_long_nameMeta));
    } else if (isInserting) {
      context.missing(_route_long_nameMeta);
    }
    if (data.containsKey('route_desc')) {
      context.handle(
          _route_descMeta,
          route_desc.isAcceptableOrUnknown(
              data['route_desc']!, _route_descMeta));
    }
    if (data.containsKey('route_type')) {
      context.handle(
          _route_typeMeta,
          route_type.isAcceptableOrUnknown(
              data['route_type']!, _route_typeMeta));
    } else if (isInserting) {
      context.missing(_route_typeMeta);
    }
    if (data.containsKey('route_url')) {
      context.handle(_route_urlMeta,
          route_url.isAcceptableOrUnknown(data['route_url']!, _route_urlMeta));
    }
    if (data.containsKey('route_color')) {
      context.handle(
          _route_colorMeta,
          route_color.isAcceptableOrUnknown(
              data['route_color']!, _route_colorMeta));
    }
    if (data.containsKey('route_text_color')) {
      context.handle(
          _route_text_colorMeta,
          route_text_color.isAcceptableOrUnknown(
              data['route_text_color']!, _route_text_colorMeta));
    }
    if (data.containsKey('route_sort_order')) {
      context.handle(
          _route_sort_orderMeta,
          route_sort_order.isAcceptableOrUnknown(
              data['route_sort_order']!, _route_sort_orderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {route_id};
  @override
  TransitRoute map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TransitRoute.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TransitRoutesTable createAlias(String alias) {
    return $TransitRoutesTable(attachedDatabase, alias);
  }
}

class CalendarData extends DataClass implements Insertable<CalendarData> {
  final String service_id;
  final bool monday;
  final bool tuesday;
  final bool wednesday;
  final bool thursday;
  final bool friday;
  final bool saturday;
  final bool sunday;
  final DateTime start_date;
  final DateTime end_date;
  CalendarData(
      {required this.service_id,
      required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday,
      required this.start_date,
      required this.end_date});
  factory CalendarData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CalendarData(
      service_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}service_id'])!,
      monday: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}monday'])!,
      tuesday: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tuesday'])!,
      wednesday: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}wednesday'])!,
      thursday: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thursday'])!,
      friday: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}friday'])!,
      saturday: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}saturday'])!,
      sunday: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sunday'])!,
      start_date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date'])!,
      end_date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['service_id'] = Variable<String>(service_id);
    map['monday'] = Variable<bool>(monday);
    map['tuesday'] = Variable<bool>(tuesday);
    map['wednesday'] = Variable<bool>(wednesday);
    map['thursday'] = Variable<bool>(thursday);
    map['friday'] = Variable<bool>(friday);
    map['saturday'] = Variable<bool>(saturday);
    map['sunday'] = Variable<bool>(sunday);
    map['start_date'] = Variable<DateTime>(start_date);
    map['end_date'] = Variable<DateTime>(end_date);
    return map;
  }

  CalendarCompanion toCompanion(bool nullToAbsent) {
    return CalendarCompanion(
      service_id: Value(service_id),
      monday: Value(monday),
      tuesday: Value(tuesday),
      wednesday: Value(wednesday),
      thursday: Value(thursday),
      friday: Value(friday),
      saturday: Value(saturday),
      sunday: Value(sunday),
      start_date: Value(start_date),
      end_date: Value(end_date),
    );
  }

  factory CalendarData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarData(
      service_id: serializer.fromJson<String>(json['service_id']),
      monday: serializer.fromJson<bool>(json['monday']),
      tuesday: serializer.fromJson<bool>(json['tuesday']),
      wednesday: serializer.fromJson<bool>(json['wednesday']),
      thursday: serializer.fromJson<bool>(json['thursday']),
      friday: serializer.fromJson<bool>(json['friday']),
      saturday: serializer.fromJson<bool>(json['saturday']),
      sunday: serializer.fromJson<bool>(json['sunday']),
      start_date: serializer.fromJson<DateTime>(json['start_date']),
      end_date: serializer.fromJson<DateTime>(json['end_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'service_id': serializer.toJson<String>(service_id),
      'monday': serializer.toJson<bool>(monday),
      'tuesday': serializer.toJson<bool>(tuesday),
      'wednesday': serializer.toJson<bool>(wednesday),
      'thursday': serializer.toJson<bool>(thursday),
      'friday': serializer.toJson<bool>(friday),
      'saturday': serializer.toJson<bool>(saturday),
      'sunday': serializer.toJson<bool>(sunday),
      'start_date': serializer.toJson<DateTime>(start_date),
      'end_date': serializer.toJson<DateTime>(end_date),
    };
  }

  CalendarData copyWith(
          {String? service_id,
          bool? monday,
          bool? tuesday,
          bool? wednesday,
          bool? thursday,
          bool? friday,
          bool? saturday,
          bool? sunday,
          DateTime? start_date,
          DateTime? end_date}) =>
      CalendarData(
        service_id: service_id ?? this.service_id,
        monday: monday ?? this.monday,
        tuesday: tuesday ?? this.tuesday,
        wednesday: wednesday ?? this.wednesday,
        thursday: thursday ?? this.thursday,
        friday: friday ?? this.friday,
        saturday: saturday ?? this.saturday,
        sunday: sunday ?? this.sunday,
        start_date: start_date ?? this.start_date,
        end_date: end_date ?? this.end_date,
      );
  @override
  String toString() {
    return (StringBuffer('CalendarData(')
          ..write('service_id: $service_id, ')
          ..write('monday: $monday, ')
          ..write('tuesday: $tuesday, ')
          ..write('wednesday: $wednesday, ')
          ..write('thursday: $thursday, ')
          ..write('friday: $friday, ')
          ..write('saturday: $saturday, ')
          ..write('sunday: $sunday, ')
          ..write('start_date: $start_date, ')
          ..write('end_date: $end_date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(service_id, monday, tuesday, wednesday,
      thursday, friday, saturday, sunday, start_date, end_date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarData &&
          other.service_id == this.service_id &&
          other.monday == this.monday &&
          other.tuesday == this.tuesday &&
          other.wednesday == this.wednesday &&
          other.thursday == this.thursday &&
          other.friday == this.friday &&
          other.saturday == this.saturday &&
          other.sunday == this.sunday &&
          other.start_date == this.start_date &&
          other.end_date == this.end_date);
}

class CalendarCompanion extends UpdateCompanion<CalendarData> {
  final Value<String> service_id;
  final Value<bool> monday;
  final Value<bool> tuesday;
  final Value<bool> wednesday;
  final Value<bool> thursday;
  final Value<bool> friday;
  final Value<bool> saturday;
  final Value<bool> sunday;
  final Value<DateTime> start_date;
  final Value<DateTime> end_date;
  const CalendarCompanion({
    this.service_id = const Value.absent(),
    this.monday = const Value.absent(),
    this.tuesday = const Value.absent(),
    this.wednesday = const Value.absent(),
    this.thursday = const Value.absent(),
    this.friday = const Value.absent(),
    this.saturday = const Value.absent(),
    this.sunday = const Value.absent(),
    this.start_date = const Value.absent(),
    this.end_date = const Value.absent(),
  });
  CalendarCompanion.insert({
    required String service_id,
    required bool monday,
    required bool tuesday,
    required bool wednesday,
    required bool thursday,
    required bool friday,
    required bool saturday,
    required bool sunday,
    required DateTime start_date,
    required DateTime end_date,
  })  : service_id = Value(service_id),
        monday = Value(monday),
        tuesday = Value(tuesday),
        wednesday = Value(wednesday),
        thursday = Value(thursday),
        friday = Value(friday),
        saturday = Value(saturday),
        sunday = Value(sunday),
        start_date = Value(start_date),
        end_date = Value(end_date);
  static Insertable<CalendarData> custom({
    Expression<String>? service_id,
    Expression<bool>? monday,
    Expression<bool>? tuesday,
    Expression<bool>? wednesday,
    Expression<bool>? thursday,
    Expression<bool>? friday,
    Expression<bool>? saturday,
    Expression<bool>? sunday,
    Expression<DateTime>? start_date,
    Expression<DateTime>? end_date,
  }) {
    return RawValuesInsertable({
      if (service_id != null) 'service_id': service_id,
      if (monday != null) 'monday': monday,
      if (tuesday != null) 'tuesday': tuesday,
      if (wednesday != null) 'wednesday': wednesday,
      if (thursday != null) 'thursday': thursday,
      if (friday != null) 'friday': friday,
      if (saturday != null) 'saturday': saturday,
      if (sunday != null) 'sunday': sunday,
      if (start_date != null) 'start_date': start_date,
      if (end_date != null) 'end_date': end_date,
    });
  }

  CalendarCompanion copyWith(
      {Value<String>? service_id,
      Value<bool>? monday,
      Value<bool>? tuesday,
      Value<bool>? wednesday,
      Value<bool>? thursday,
      Value<bool>? friday,
      Value<bool>? saturday,
      Value<bool>? sunday,
      Value<DateTime>? start_date,
      Value<DateTime>? end_date}) {
    return CalendarCompanion(
      service_id: service_id ?? this.service_id,
      monday: monday ?? this.monday,
      tuesday: tuesday ?? this.tuesday,
      wednesday: wednesday ?? this.wednesday,
      thursday: thursday ?? this.thursday,
      friday: friday ?? this.friday,
      saturday: saturday ?? this.saturday,
      sunday: sunday ?? this.sunday,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (service_id.present) {
      map['service_id'] = Variable<String>(service_id.value);
    }
    if (monday.present) {
      map['monday'] = Variable<bool>(monday.value);
    }
    if (tuesday.present) {
      map['tuesday'] = Variable<bool>(tuesday.value);
    }
    if (wednesday.present) {
      map['wednesday'] = Variable<bool>(wednesday.value);
    }
    if (thursday.present) {
      map['thursday'] = Variable<bool>(thursday.value);
    }
    if (friday.present) {
      map['friday'] = Variable<bool>(friday.value);
    }
    if (saturday.present) {
      map['saturday'] = Variable<bool>(saturday.value);
    }
    if (sunday.present) {
      map['sunday'] = Variable<bool>(sunday.value);
    }
    if (start_date.present) {
      map['start_date'] = Variable<DateTime>(start_date.value);
    }
    if (end_date.present) {
      map['end_date'] = Variable<DateTime>(end_date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarCompanion(')
          ..write('service_id: $service_id, ')
          ..write('monday: $monday, ')
          ..write('tuesday: $tuesday, ')
          ..write('wednesday: $wednesday, ')
          ..write('thursday: $thursday, ')
          ..write('friday: $friday, ')
          ..write('saturday: $saturday, ')
          ..write('sunday: $sunday, ')
          ..write('start_date: $start_date, ')
          ..write('end_date: $end_date')
          ..write(')'))
        .toString();
  }
}

class $CalendarTable extends Calendar
    with TableInfo<$CalendarTable, CalendarData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _service_idMeta = const VerificationMeta('service_id');
  @override
  late final GeneratedColumn<String?> service_id = GeneratedColumn<String?>(
      'service_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _mondayMeta = const VerificationMeta('monday');
  @override
  late final GeneratedColumn<bool?> monday = GeneratedColumn<bool?>(
      'monday', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (monday IN (0, 1))');
  final VerificationMeta _tuesdayMeta = const VerificationMeta('tuesday');
  @override
  late final GeneratedColumn<bool?> tuesday = GeneratedColumn<bool?>(
      'tuesday', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (tuesday IN (0, 1))');
  final VerificationMeta _wednesdayMeta = const VerificationMeta('wednesday');
  @override
  late final GeneratedColumn<bool?> wednesday = GeneratedColumn<bool?>(
      'wednesday', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (wednesday IN (0, 1))');
  final VerificationMeta _thursdayMeta = const VerificationMeta('thursday');
  @override
  late final GeneratedColumn<bool?> thursday = GeneratedColumn<bool?>(
      'thursday', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (thursday IN (0, 1))');
  final VerificationMeta _fridayMeta = const VerificationMeta('friday');
  @override
  late final GeneratedColumn<bool?> friday = GeneratedColumn<bool?>(
      'friday', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (friday IN (0, 1))');
  final VerificationMeta _saturdayMeta = const VerificationMeta('saturday');
  @override
  late final GeneratedColumn<bool?> saturday = GeneratedColumn<bool?>(
      'saturday', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (saturday IN (0, 1))');
  final VerificationMeta _sundayMeta = const VerificationMeta('sunday');
  @override
  late final GeneratedColumn<bool?> sunday = GeneratedColumn<bool?>(
      'sunday', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (sunday IN (0, 1))');
  final VerificationMeta _start_dateMeta = const VerificationMeta('start_date');
  @override
  late final GeneratedColumn<DateTime?> start_date = GeneratedColumn<DateTime?>(
      'start_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _end_dateMeta = const VerificationMeta('end_date');
  @override
  late final GeneratedColumn<DateTime?> end_date = GeneratedColumn<DateTime?>(
      'end_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        service_id,
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday,
        start_date,
        end_date
      ];
  @override
  String get aliasedName => _alias ?? 'calendar';
  @override
  String get actualTableName => 'calendar';
  @override
  VerificationContext validateIntegrity(Insertable<CalendarData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('service_id')) {
      context.handle(
          _service_idMeta,
          service_id.isAcceptableOrUnknown(
              data['service_id']!, _service_idMeta));
    } else if (isInserting) {
      context.missing(_service_idMeta);
    }
    if (data.containsKey('monday')) {
      context.handle(_mondayMeta,
          monday.isAcceptableOrUnknown(data['monday']!, _mondayMeta));
    } else if (isInserting) {
      context.missing(_mondayMeta);
    }
    if (data.containsKey('tuesday')) {
      context.handle(_tuesdayMeta,
          tuesday.isAcceptableOrUnknown(data['tuesday']!, _tuesdayMeta));
    } else if (isInserting) {
      context.missing(_tuesdayMeta);
    }
    if (data.containsKey('wednesday')) {
      context.handle(_wednesdayMeta,
          wednesday.isAcceptableOrUnknown(data['wednesday']!, _wednesdayMeta));
    } else if (isInserting) {
      context.missing(_wednesdayMeta);
    }
    if (data.containsKey('thursday')) {
      context.handle(_thursdayMeta,
          thursday.isAcceptableOrUnknown(data['thursday']!, _thursdayMeta));
    } else if (isInserting) {
      context.missing(_thursdayMeta);
    }
    if (data.containsKey('friday')) {
      context.handle(_fridayMeta,
          friday.isAcceptableOrUnknown(data['friday']!, _fridayMeta));
    } else if (isInserting) {
      context.missing(_fridayMeta);
    }
    if (data.containsKey('saturday')) {
      context.handle(_saturdayMeta,
          saturday.isAcceptableOrUnknown(data['saturday']!, _saturdayMeta));
    } else if (isInserting) {
      context.missing(_saturdayMeta);
    }
    if (data.containsKey('sunday')) {
      context.handle(_sundayMeta,
          sunday.isAcceptableOrUnknown(data['sunday']!, _sundayMeta));
    } else if (isInserting) {
      context.missing(_sundayMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
          _start_dateMeta,
          start_date.isAcceptableOrUnknown(
              data['start_date']!, _start_dateMeta));
    } else if (isInserting) {
      context.missing(_start_dateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_end_dateMeta,
          end_date.isAcceptableOrUnknown(data['end_date']!, _end_dateMeta));
    } else if (isInserting) {
      context.missing(_end_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {service_id};
  @override
  CalendarData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CalendarData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CalendarTable createAlias(String alias) {
    return $CalendarTable(attachedDatabase, alias);
  }
}

class Shape extends DataClass implements Insertable<Shape> {
  final String shape_id;
  final double shape_pt_lat;
  final double shape_pt_lon;
  final int shape_pt_sequence;
  final double? shape_dist_traveled;
  Shape(
      {required this.shape_id,
      required this.shape_pt_lat,
      required this.shape_pt_lon,
      required this.shape_pt_sequence,
      this.shape_dist_traveled});
  factory Shape.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Shape(
      shape_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}shape_id'])!,
      shape_pt_lat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}shape_pt_lat'])!,
      shape_pt_lon: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}shape_pt_lon'])!,
      shape_pt_sequence: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}shape_pt_sequence'])!,
      shape_dist_traveled: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}shape_dist_traveled']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['shape_id'] = Variable<String>(shape_id);
    map['shape_pt_lat'] = Variable<double>(shape_pt_lat);
    map['shape_pt_lon'] = Variable<double>(shape_pt_lon);
    map['shape_pt_sequence'] = Variable<int>(shape_pt_sequence);
    if (!nullToAbsent || shape_dist_traveled != null) {
      map['shape_dist_traveled'] = Variable<double?>(shape_dist_traveled);
    }
    return map;
  }

  ShapesCompanion toCompanion(bool nullToAbsent) {
    return ShapesCompanion(
      shape_id: Value(shape_id),
      shape_pt_lat: Value(shape_pt_lat),
      shape_pt_lon: Value(shape_pt_lon),
      shape_pt_sequence: Value(shape_pt_sequence),
      shape_dist_traveled: shape_dist_traveled == null && nullToAbsent
          ? const Value.absent()
          : Value(shape_dist_traveled),
    );
  }

  factory Shape.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shape(
      shape_id: serializer.fromJson<String>(json['shape_id']),
      shape_pt_lat: serializer.fromJson<double>(json['shape_pt_lat']),
      shape_pt_lon: serializer.fromJson<double>(json['shape_pt_lon']),
      shape_pt_sequence: serializer.fromJson<int>(json['shape_pt_sequence']),
      shape_dist_traveled:
          serializer.fromJson<double?>(json['shape_dist_traveled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'shape_id': serializer.toJson<String>(shape_id),
      'shape_pt_lat': serializer.toJson<double>(shape_pt_lat),
      'shape_pt_lon': serializer.toJson<double>(shape_pt_lon),
      'shape_pt_sequence': serializer.toJson<int>(shape_pt_sequence),
      'shape_dist_traveled': serializer.toJson<double?>(shape_dist_traveled),
    };
  }

  Shape copyWith(
          {String? shape_id,
          double? shape_pt_lat,
          double? shape_pt_lon,
          int? shape_pt_sequence,
          double? shape_dist_traveled}) =>
      Shape(
        shape_id: shape_id ?? this.shape_id,
        shape_pt_lat: shape_pt_lat ?? this.shape_pt_lat,
        shape_pt_lon: shape_pt_lon ?? this.shape_pt_lon,
        shape_pt_sequence: shape_pt_sequence ?? this.shape_pt_sequence,
        shape_dist_traveled: shape_dist_traveled ?? this.shape_dist_traveled,
      );
  @override
  String toString() {
    return (StringBuffer('Shape(')
          ..write('shape_id: $shape_id, ')
          ..write('shape_pt_lat: $shape_pt_lat, ')
          ..write('shape_pt_lon: $shape_pt_lon, ')
          ..write('shape_pt_sequence: $shape_pt_sequence, ')
          ..write('shape_dist_traveled: $shape_dist_traveled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(shape_id, shape_pt_lat, shape_pt_lon,
      shape_pt_sequence, shape_dist_traveled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shape &&
          other.shape_id == this.shape_id &&
          other.shape_pt_lat == this.shape_pt_lat &&
          other.shape_pt_lon == this.shape_pt_lon &&
          other.shape_pt_sequence == this.shape_pt_sequence &&
          other.shape_dist_traveled == this.shape_dist_traveled);
}

class ShapesCompanion extends UpdateCompanion<Shape> {
  final Value<String> shape_id;
  final Value<double> shape_pt_lat;
  final Value<double> shape_pt_lon;
  final Value<int> shape_pt_sequence;
  final Value<double?> shape_dist_traveled;
  const ShapesCompanion({
    this.shape_id = const Value.absent(),
    this.shape_pt_lat = const Value.absent(),
    this.shape_pt_lon = const Value.absent(),
    this.shape_pt_sequence = const Value.absent(),
    this.shape_dist_traveled = const Value.absent(),
  });
  ShapesCompanion.insert({
    required String shape_id,
    required double shape_pt_lat,
    required double shape_pt_lon,
    required int shape_pt_sequence,
    this.shape_dist_traveled = const Value.absent(),
  })  : shape_id = Value(shape_id),
        shape_pt_lat = Value(shape_pt_lat),
        shape_pt_lon = Value(shape_pt_lon),
        shape_pt_sequence = Value(shape_pt_sequence);
  static Insertable<Shape> custom({
    Expression<String>? shape_id,
    Expression<double>? shape_pt_lat,
    Expression<double>? shape_pt_lon,
    Expression<int>? shape_pt_sequence,
    Expression<double?>? shape_dist_traveled,
  }) {
    return RawValuesInsertable({
      if (shape_id != null) 'shape_id': shape_id,
      if (shape_pt_lat != null) 'shape_pt_lat': shape_pt_lat,
      if (shape_pt_lon != null) 'shape_pt_lon': shape_pt_lon,
      if (shape_pt_sequence != null) 'shape_pt_sequence': shape_pt_sequence,
      if (shape_dist_traveled != null)
        'shape_dist_traveled': shape_dist_traveled,
    });
  }

  ShapesCompanion copyWith(
      {Value<String>? shape_id,
      Value<double>? shape_pt_lat,
      Value<double>? shape_pt_lon,
      Value<int>? shape_pt_sequence,
      Value<double?>? shape_dist_traveled}) {
    return ShapesCompanion(
      shape_id: shape_id ?? this.shape_id,
      shape_pt_lat: shape_pt_lat ?? this.shape_pt_lat,
      shape_pt_lon: shape_pt_lon ?? this.shape_pt_lon,
      shape_pt_sequence: shape_pt_sequence ?? this.shape_pt_sequence,
      shape_dist_traveled: shape_dist_traveled ?? this.shape_dist_traveled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (shape_id.present) {
      map['shape_id'] = Variable<String>(shape_id.value);
    }
    if (shape_pt_lat.present) {
      map['shape_pt_lat'] = Variable<double>(shape_pt_lat.value);
    }
    if (shape_pt_lon.present) {
      map['shape_pt_lon'] = Variable<double>(shape_pt_lon.value);
    }
    if (shape_pt_sequence.present) {
      map['shape_pt_sequence'] = Variable<int>(shape_pt_sequence.value);
    }
    if (shape_dist_traveled.present) {
      map['shape_dist_traveled'] = Variable<double?>(shape_dist_traveled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShapesCompanion(')
          ..write('shape_id: $shape_id, ')
          ..write('shape_pt_lat: $shape_pt_lat, ')
          ..write('shape_pt_lon: $shape_pt_lon, ')
          ..write('shape_pt_sequence: $shape_pt_sequence, ')
          ..write('shape_dist_traveled: $shape_dist_traveled')
          ..write(')'))
        .toString();
  }
}

class $ShapesTable extends Shapes with TableInfo<$ShapesTable, Shape> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShapesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _shape_idMeta = const VerificationMeta('shape_id');
  @override
  late final GeneratedColumn<String?> shape_id = GeneratedColumn<String?>(
      'shape_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _shape_pt_latMeta =
      const VerificationMeta('shape_pt_lat');
  @override
  late final GeneratedColumn<double?> shape_pt_lat = GeneratedColumn<double?>(
      'shape_pt_lat', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _shape_pt_lonMeta =
      const VerificationMeta('shape_pt_lon');
  @override
  late final GeneratedColumn<double?> shape_pt_lon = GeneratedColumn<double?>(
      'shape_pt_lon', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _shape_pt_sequenceMeta =
      const VerificationMeta('shape_pt_sequence');
  @override
  late final GeneratedColumn<int?> shape_pt_sequence = GeneratedColumn<int?>(
      'shape_pt_sequence', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _shape_dist_traveledMeta =
      const VerificationMeta('shape_dist_traveled');
  @override
  late final GeneratedColumn<double?> shape_dist_traveled =
      GeneratedColumn<double?>('shape_dist_traveled', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        shape_id,
        shape_pt_lat,
        shape_pt_lon,
        shape_pt_sequence,
        shape_dist_traveled
      ];
  @override
  String get aliasedName => _alias ?? 'shapes';
  @override
  String get actualTableName => 'shapes';
  @override
  VerificationContext validateIntegrity(Insertable<Shape> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('shape_id')) {
      context.handle(_shape_idMeta,
          shape_id.isAcceptableOrUnknown(data['shape_id']!, _shape_idMeta));
    } else if (isInserting) {
      context.missing(_shape_idMeta);
    }
    if (data.containsKey('shape_pt_lat')) {
      context.handle(
          _shape_pt_latMeta,
          shape_pt_lat.isAcceptableOrUnknown(
              data['shape_pt_lat']!, _shape_pt_latMeta));
    } else if (isInserting) {
      context.missing(_shape_pt_latMeta);
    }
    if (data.containsKey('shape_pt_lon')) {
      context.handle(
          _shape_pt_lonMeta,
          shape_pt_lon.isAcceptableOrUnknown(
              data['shape_pt_lon']!, _shape_pt_lonMeta));
    } else if (isInserting) {
      context.missing(_shape_pt_lonMeta);
    }
    if (data.containsKey('shape_pt_sequence')) {
      context.handle(
          _shape_pt_sequenceMeta,
          shape_pt_sequence.isAcceptableOrUnknown(
              data['shape_pt_sequence']!, _shape_pt_sequenceMeta));
    } else if (isInserting) {
      context.missing(_shape_pt_sequenceMeta);
    }
    if (data.containsKey('shape_dist_traveled')) {
      context.handle(
          _shape_dist_traveledMeta,
          shape_dist_traveled.isAcceptableOrUnknown(
              data['shape_dist_traveled']!, _shape_dist_traveledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {shape_id, shape_pt_sequence};
  @override
  Shape map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Shape.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ShapesTable createAlias(String alias) {
    return $ShapesTable(attachedDatabase, alias);
  }
}

class Trip extends DataClass implements Insertable<Trip> {
  final String route_id;
  final String service_id;
  final String trip_id;
  final String? trip_headsign;
  final String? trip_short_name;
  final int? direction_id;
  final String? block_id;
  final String? shape_id;
  final int? wheelchair_accessible;
  final int? bikes_allowed;
  Trip(
      {required this.route_id,
      required this.service_id,
      required this.trip_id,
      this.trip_headsign,
      this.trip_short_name,
      this.direction_id,
      this.block_id,
      this.shape_id,
      this.wheelchair_accessible,
      this.bikes_allowed});
  factory Trip.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Trip(
      route_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}route_id'])!,
      service_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}service_id'])!,
      trip_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}trip_id'])!,
      trip_headsign: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}trip_headsign']),
      trip_short_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}trip_short_name']),
      direction_id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}direction_id']),
      block_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}block_id']),
      shape_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}shape_id']),
      wheelchair_accessible: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}wheelchair_accessible']),
      bikes_allowed: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bikes_allowed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['route_id'] = Variable<String>(route_id);
    map['service_id'] = Variable<String>(service_id);
    map['trip_id'] = Variable<String>(trip_id);
    if (!nullToAbsent || trip_headsign != null) {
      map['trip_headsign'] = Variable<String?>(trip_headsign);
    }
    if (!nullToAbsent || trip_short_name != null) {
      map['trip_short_name'] = Variable<String?>(trip_short_name);
    }
    if (!nullToAbsent || direction_id != null) {
      map['direction_id'] = Variable<int?>(direction_id);
    }
    if (!nullToAbsent || block_id != null) {
      map['block_id'] = Variable<String?>(block_id);
    }
    if (!nullToAbsent || shape_id != null) {
      map['shape_id'] = Variable<String?>(shape_id);
    }
    if (!nullToAbsent || wheelchair_accessible != null) {
      map['wheelchair_accessible'] = Variable<int?>(wheelchair_accessible);
    }
    if (!nullToAbsent || bikes_allowed != null) {
      map['bikes_allowed'] = Variable<int?>(bikes_allowed);
    }
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      route_id: Value(route_id),
      service_id: Value(service_id),
      trip_id: Value(trip_id),
      trip_headsign: trip_headsign == null && nullToAbsent
          ? const Value.absent()
          : Value(trip_headsign),
      trip_short_name: trip_short_name == null && nullToAbsent
          ? const Value.absent()
          : Value(trip_short_name),
      direction_id: direction_id == null && nullToAbsent
          ? const Value.absent()
          : Value(direction_id),
      block_id: block_id == null && nullToAbsent
          ? const Value.absent()
          : Value(block_id),
      shape_id: shape_id == null && nullToAbsent
          ? const Value.absent()
          : Value(shape_id),
      wheelchair_accessible: wheelchair_accessible == null && nullToAbsent
          ? const Value.absent()
          : Value(wheelchair_accessible),
      bikes_allowed: bikes_allowed == null && nullToAbsent
          ? const Value.absent()
          : Value(bikes_allowed),
    );
  }

  factory Trip.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trip(
      route_id: serializer.fromJson<String>(json['route_id']),
      service_id: serializer.fromJson<String>(json['service_id']),
      trip_id: serializer.fromJson<String>(json['trip_id']),
      trip_headsign: serializer.fromJson<String?>(json['trip_headsign']),
      trip_short_name: serializer.fromJson<String?>(json['trip_short_name']),
      direction_id: serializer.fromJson<int?>(json['direction_id']),
      block_id: serializer.fromJson<String?>(json['block_id']),
      shape_id: serializer.fromJson<String?>(json['shape_id']),
      wheelchair_accessible:
          serializer.fromJson<int?>(json['wheelchair_accessible']),
      bikes_allowed: serializer.fromJson<int?>(json['bikes_allowed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'route_id': serializer.toJson<String>(route_id),
      'service_id': serializer.toJson<String>(service_id),
      'trip_id': serializer.toJson<String>(trip_id),
      'trip_headsign': serializer.toJson<String?>(trip_headsign),
      'trip_short_name': serializer.toJson<String?>(trip_short_name),
      'direction_id': serializer.toJson<int?>(direction_id),
      'block_id': serializer.toJson<String?>(block_id),
      'shape_id': serializer.toJson<String?>(shape_id),
      'wheelchair_accessible': serializer.toJson<int?>(wheelchair_accessible),
      'bikes_allowed': serializer.toJson<int?>(bikes_allowed),
    };
  }

  Trip copyWith(
          {String? route_id,
          String? service_id,
          String? trip_id,
          String? trip_headsign,
          String? trip_short_name,
          int? direction_id,
          String? block_id,
          String? shape_id,
          int? wheelchair_accessible,
          int? bikes_allowed}) =>
      Trip(
        route_id: route_id ?? this.route_id,
        service_id: service_id ?? this.service_id,
        trip_id: trip_id ?? this.trip_id,
        trip_headsign: trip_headsign ?? this.trip_headsign,
        trip_short_name: trip_short_name ?? this.trip_short_name,
        direction_id: direction_id ?? this.direction_id,
        block_id: block_id ?? this.block_id,
        shape_id: shape_id ?? this.shape_id,
        wheelchair_accessible:
            wheelchair_accessible ?? this.wheelchair_accessible,
        bikes_allowed: bikes_allowed ?? this.bikes_allowed,
      );
  @override
  String toString() {
    return (StringBuffer('Trip(')
          ..write('route_id: $route_id, ')
          ..write('service_id: $service_id, ')
          ..write('trip_id: $trip_id, ')
          ..write('trip_headsign: $trip_headsign, ')
          ..write('trip_short_name: $trip_short_name, ')
          ..write('direction_id: $direction_id, ')
          ..write('block_id: $block_id, ')
          ..write('shape_id: $shape_id, ')
          ..write('wheelchair_accessible: $wheelchair_accessible, ')
          ..write('bikes_allowed: $bikes_allowed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      route_id,
      service_id,
      trip_id,
      trip_headsign,
      trip_short_name,
      direction_id,
      block_id,
      shape_id,
      wheelchair_accessible,
      bikes_allowed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trip &&
          other.route_id == this.route_id &&
          other.service_id == this.service_id &&
          other.trip_id == this.trip_id &&
          other.trip_headsign == this.trip_headsign &&
          other.trip_short_name == this.trip_short_name &&
          other.direction_id == this.direction_id &&
          other.block_id == this.block_id &&
          other.shape_id == this.shape_id &&
          other.wheelchair_accessible == this.wheelchair_accessible &&
          other.bikes_allowed == this.bikes_allowed);
}

class TripsCompanion extends UpdateCompanion<Trip> {
  final Value<String> route_id;
  final Value<String> service_id;
  final Value<String> trip_id;
  final Value<String?> trip_headsign;
  final Value<String?> trip_short_name;
  final Value<int?> direction_id;
  final Value<String?> block_id;
  final Value<String?> shape_id;
  final Value<int?> wheelchair_accessible;
  final Value<int?> bikes_allowed;
  const TripsCompanion({
    this.route_id = const Value.absent(),
    this.service_id = const Value.absent(),
    this.trip_id = const Value.absent(),
    this.trip_headsign = const Value.absent(),
    this.trip_short_name = const Value.absent(),
    this.direction_id = const Value.absent(),
    this.block_id = const Value.absent(),
    this.shape_id = const Value.absent(),
    this.wheelchair_accessible = const Value.absent(),
    this.bikes_allowed = const Value.absent(),
  });
  TripsCompanion.insert({
    required String route_id,
    required String service_id,
    required String trip_id,
    this.trip_headsign = const Value.absent(),
    this.trip_short_name = const Value.absent(),
    this.direction_id = const Value.absent(),
    this.block_id = const Value.absent(),
    this.shape_id = const Value.absent(),
    this.wheelchair_accessible = const Value.absent(),
    this.bikes_allowed = const Value.absent(),
  })  : route_id = Value(route_id),
        service_id = Value(service_id),
        trip_id = Value(trip_id);
  static Insertable<Trip> custom({
    Expression<String>? route_id,
    Expression<String>? service_id,
    Expression<String>? trip_id,
    Expression<String?>? trip_headsign,
    Expression<String?>? trip_short_name,
    Expression<int?>? direction_id,
    Expression<String?>? block_id,
    Expression<String?>? shape_id,
    Expression<int?>? wheelchair_accessible,
    Expression<int?>? bikes_allowed,
  }) {
    return RawValuesInsertable({
      if (route_id != null) 'route_id': route_id,
      if (service_id != null) 'service_id': service_id,
      if (trip_id != null) 'trip_id': trip_id,
      if (trip_headsign != null) 'trip_headsign': trip_headsign,
      if (trip_short_name != null) 'trip_short_name': trip_short_name,
      if (direction_id != null) 'direction_id': direction_id,
      if (block_id != null) 'block_id': block_id,
      if (shape_id != null) 'shape_id': shape_id,
      if (wheelchair_accessible != null)
        'wheelchair_accessible': wheelchair_accessible,
      if (bikes_allowed != null) 'bikes_allowed': bikes_allowed,
    });
  }

  TripsCompanion copyWith(
      {Value<String>? route_id,
      Value<String>? service_id,
      Value<String>? trip_id,
      Value<String?>? trip_headsign,
      Value<String?>? trip_short_name,
      Value<int?>? direction_id,
      Value<String?>? block_id,
      Value<String?>? shape_id,
      Value<int?>? wheelchair_accessible,
      Value<int?>? bikes_allowed}) {
    return TripsCompanion(
      route_id: route_id ?? this.route_id,
      service_id: service_id ?? this.service_id,
      trip_id: trip_id ?? this.trip_id,
      trip_headsign: trip_headsign ?? this.trip_headsign,
      trip_short_name: trip_short_name ?? this.trip_short_name,
      direction_id: direction_id ?? this.direction_id,
      block_id: block_id ?? this.block_id,
      shape_id: shape_id ?? this.shape_id,
      wheelchair_accessible:
          wheelchair_accessible ?? this.wheelchair_accessible,
      bikes_allowed: bikes_allowed ?? this.bikes_allowed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (route_id.present) {
      map['route_id'] = Variable<String>(route_id.value);
    }
    if (service_id.present) {
      map['service_id'] = Variable<String>(service_id.value);
    }
    if (trip_id.present) {
      map['trip_id'] = Variable<String>(trip_id.value);
    }
    if (trip_headsign.present) {
      map['trip_headsign'] = Variable<String?>(trip_headsign.value);
    }
    if (trip_short_name.present) {
      map['trip_short_name'] = Variable<String?>(trip_short_name.value);
    }
    if (direction_id.present) {
      map['direction_id'] = Variable<int?>(direction_id.value);
    }
    if (block_id.present) {
      map['block_id'] = Variable<String?>(block_id.value);
    }
    if (shape_id.present) {
      map['shape_id'] = Variable<String?>(shape_id.value);
    }
    if (wheelchair_accessible.present) {
      map['wheelchair_accessible'] =
          Variable<int?>(wheelchair_accessible.value);
    }
    if (bikes_allowed.present) {
      map['bikes_allowed'] = Variable<int?>(bikes_allowed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('route_id: $route_id, ')
          ..write('service_id: $service_id, ')
          ..write('trip_id: $trip_id, ')
          ..write('trip_headsign: $trip_headsign, ')
          ..write('trip_short_name: $trip_short_name, ')
          ..write('direction_id: $direction_id, ')
          ..write('block_id: $block_id, ')
          ..write('shape_id: $shape_id, ')
          ..write('wheelchair_accessible: $wheelchair_accessible, ')
          ..write('bikes_allowed: $bikes_allowed')
          ..write(')'))
        .toString();
  }
}

class $TripsTable extends Trips with TableInfo<$TripsTable, Trip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _route_idMeta = const VerificationMeta('route_id');
  @override
  late final GeneratedColumn<String?> route_id = GeneratedColumn<String?>(
      'route_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES transit_routes (route_id)');
  final VerificationMeta _service_idMeta = const VerificationMeta('service_id');
  @override
  late final GeneratedColumn<String?> service_id = GeneratedColumn<String?>(
      'service_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES calendar (service_id)');
  final VerificationMeta _trip_idMeta = const VerificationMeta('trip_id');
  @override
  late final GeneratedColumn<String?> trip_id = GeneratedColumn<String?>(
      'trip_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _trip_headsignMeta =
      const VerificationMeta('trip_headsign');
  @override
  late final GeneratedColumn<String?> trip_headsign = GeneratedColumn<String?>(
      'trip_headsign', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _trip_short_nameMeta =
      const VerificationMeta('trip_short_name');
  @override
  late final GeneratedColumn<String?> trip_short_name =
      GeneratedColumn<String?>('trip_short_name', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _direction_idMeta =
      const VerificationMeta('direction_id');
  @override
  late final GeneratedColumn<int?> direction_id = GeneratedColumn<int?>(
      'direction_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _block_idMeta = const VerificationMeta('block_id');
  @override
  late final GeneratedColumn<String?> block_id = GeneratedColumn<String?>(
      'block_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _shape_idMeta = const VerificationMeta('shape_id');
  @override
  late final GeneratedColumn<String?> shape_id = GeneratedColumn<String?>(
      'shape_id', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES shapes (shape_id)');
  final VerificationMeta _wheelchair_accessibleMeta =
      const VerificationMeta('wheelchair_accessible');
  @override
  late final GeneratedColumn<int?> wheelchair_accessible =
      GeneratedColumn<int?>('wheelchair_accessible', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _bikes_allowedMeta =
      const VerificationMeta('bikes_allowed');
  @override
  late final GeneratedColumn<int?> bikes_allowed = GeneratedColumn<int?>(
      'bikes_allowed', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        route_id,
        service_id,
        trip_id,
        trip_headsign,
        trip_short_name,
        direction_id,
        block_id,
        shape_id,
        wheelchair_accessible,
        bikes_allowed
      ];
  @override
  String get aliasedName => _alias ?? 'trips';
  @override
  String get actualTableName => 'trips';
  @override
  VerificationContext validateIntegrity(Insertable<Trip> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('route_id')) {
      context.handle(_route_idMeta,
          route_id.isAcceptableOrUnknown(data['route_id']!, _route_idMeta));
    } else if (isInserting) {
      context.missing(_route_idMeta);
    }
    if (data.containsKey('service_id')) {
      context.handle(
          _service_idMeta,
          service_id.isAcceptableOrUnknown(
              data['service_id']!, _service_idMeta));
    } else if (isInserting) {
      context.missing(_service_idMeta);
    }
    if (data.containsKey('trip_id')) {
      context.handle(_trip_idMeta,
          trip_id.isAcceptableOrUnknown(data['trip_id']!, _trip_idMeta));
    } else if (isInserting) {
      context.missing(_trip_idMeta);
    }
    if (data.containsKey('trip_headsign')) {
      context.handle(
          _trip_headsignMeta,
          trip_headsign.isAcceptableOrUnknown(
              data['trip_headsign']!, _trip_headsignMeta));
    }
    if (data.containsKey('trip_short_name')) {
      context.handle(
          _trip_short_nameMeta,
          trip_short_name.isAcceptableOrUnknown(
              data['trip_short_name']!, _trip_short_nameMeta));
    }
    if (data.containsKey('direction_id')) {
      context.handle(
          _direction_idMeta,
          direction_id.isAcceptableOrUnknown(
              data['direction_id']!, _direction_idMeta));
    }
    if (data.containsKey('block_id')) {
      context.handle(_block_idMeta,
          block_id.isAcceptableOrUnknown(data['block_id']!, _block_idMeta));
    }
    if (data.containsKey('shape_id')) {
      context.handle(_shape_idMeta,
          shape_id.isAcceptableOrUnknown(data['shape_id']!, _shape_idMeta));
    }
    if (data.containsKey('wheelchair_accessible')) {
      context.handle(
          _wheelchair_accessibleMeta,
          wheelchair_accessible.isAcceptableOrUnknown(
              data['wheelchair_accessible']!, _wheelchair_accessibleMeta));
    }
    if (data.containsKey('bikes_allowed')) {
      context.handle(
          _bikes_allowedMeta,
          bikes_allowed.isAcceptableOrUnknown(
              data['bikes_allowed']!, _bikes_allowedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trip_id};
  @override
  Trip map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Trip.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class StopTime extends DataClass implements Insertable<StopTime> {
  final String trip_id;
  final String arrival_time;
  final String departure_time;
  final String stop_id;
  final int stop_sequence;
  final int? stop_headsign;
  final int? pickup_type;
  final int? drop_off_type;
  final int? continuous_pickup;
  final int? continuous_drop_off;
  final double? shape_dist_traveled;
  final int? timepoint;
  StopTime(
      {required this.trip_id,
      required this.arrival_time,
      required this.departure_time,
      required this.stop_id,
      required this.stop_sequence,
      this.stop_headsign,
      this.pickup_type,
      this.drop_off_type,
      this.continuous_pickup,
      this.continuous_drop_off,
      this.shape_dist_traveled,
      this.timepoint});
  factory StopTime.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return StopTime(
      trip_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}trip_id'])!,
      arrival_time: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}arrival_time'])!,
      departure_time: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}departure_time'])!,
      stop_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_id'])!,
      stop_sequence: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_sequence'])!,
      stop_headsign: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stop_headsign']),
      pickup_type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pickup_type']),
      drop_off_type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}drop_off_type']),
      continuous_pickup: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}continuous_pickup']),
      continuous_drop_off: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}continuous_drop_off']),
      shape_dist_traveled: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}shape_dist_traveled']),
      timepoint: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timepoint']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['trip_id'] = Variable<String>(trip_id);
    map['arrival_time'] = Variable<String>(arrival_time);
    map['departure_time'] = Variable<String>(departure_time);
    map['stop_id'] = Variable<String>(stop_id);
    map['stop_sequence'] = Variable<int>(stop_sequence);
    if (!nullToAbsent || stop_headsign != null) {
      map['stop_headsign'] = Variable<int?>(stop_headsign);
    }
    if (!nullToAbsent || pickup_type != null) {
      map['pickup_type'] = Variable<int?>(pickup_type);
    }
    if (!nullToAbsent || drop_off_type != null) {
      map['drop_off_type'] = Variable<int?>(drop_off_type);
    }
    if (!nullToAbsent || continuous_pickup != null) {
      map['continuous_pickup'] = Variable<int?>(continuous_pickup);
    }
    if (!nullToAbsent || continuous_drop_off != null) {
      map['continuous_drop_off'] = Variable<int?>(continuous_drop_off);
    }
    if (!nullToAbsent || shape_dist_traveled != null) {
      map['shape_dist_traveled'] = Variable<double?>(shape_dist_traveled);
    }
    if (!nullToAbsent || timepoint != null) {
      map['timepoint'] = Variable<int?>(timepoint);
    }
    return map;
  }

  StopTimesCompanion toCompanion(bool nullToAbsent) {
    return StopTimesCompanion(
      trip_id: Value(trip_id),
      arrival_time: Value(arrival_time),
      departure_time: Value(departure_time),
      stop_id: Value(stop_id),
      stop_sequence: Value(stop_sequence),
      stop_headsign: stop_headsign == null && nullToAbsent
          ? const Value.absent()
          : Value(stop_headsign),
      pickup_type: pickup_type == null && nullToAbsent
          ? const Value.absent()
          : Value(pickup_type),
      drop_off_type: drop_off_type == null && nullToAbsent
          ? const Value.absent()
          : Value(drop_off_type),
      continuous_pickup: continuous_pickup == null && nullToAbsent
          ? const Value.absent()
          : Value(continuous_pickup),
      continuous_drop_off: continuous_drop_off == null && nullToAbsent
          ? const Value.absent()
          : Value(continuous_drop_off),
      shape_dist_traveled: shape_dist_traveled == null && nullToAbsent
          ? const Value.absent()
          : Value(shape_dist_traveled),
      timepoint: timepoint == null && nullToAbsent
          ? const Value.absent()
          : Value(timepoint),
    );
  }

  factory StopTime.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StopTime(
      trip_id: serializer.fromJson<String>(json['trip_id']),
      arrival_time: serializer.fromJson<String>(json['arrival_time']),
      departure_time: serializer.fromJson<String>(json['departure_time']),
      stop_id: serializer.fromJson<String>(json['stop_id']),
      stop_sequence: serializer.fromJson<int>(json['stop_sequence']),
      stop_headsign: serializer.fromJson<int?>(json['stop_headsign']),
      pickup_type: serializer.fromJson<int?>(json['pickup_type']),
      drop_off_type: serializer.fromJson<int?>(json['drop_off_type']),
      continuous_pickup: serializer.fromJson<int?>(json['continuous_pickup']),
      continuous_drop_off:
          serializer.fromJson<int?>(json['continuous_drop_off']),
      shape_dist_traveled:
          serializer.fromJson<double?>(json['shape_dist_traveled']),
      timepoint: serializer.fromJson<int?>(json['timepoint']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trip_id': serializer.toJson<String>(trip_id),
      'arrival_time': serializer.toJson<String>(arrival_time),
      'departure_time': serializer.toJson<String>(departure_time),
      'stop_id': serializer.toJson<String>(stop_id),
      'stop_sequence': serializer.toJson<int>(stop_sequence),
      'stop_headsign': serializer.toJson<int?>(stop_headsign),
      'pickup_type': serializer.toJson<int?>(pickup_type),
      'drop_off_type': serializer.toJson<int?>(drop_off_type),
      'continuous_pickup': serializer.toJson<int?>(continuous_pickup),
      'continuous_drop_off': serializer.toJson<int?>(continuous_drop_off),
      'shape_dist_traveled': serializer.toJson<double?>(shape_dist_traveled),
      'timepoint': serializer.toJson<int?>(timepoint),
    };
  }

  StopTime copyWith(
          {String? trip_id,
          String? arrival_time,
          String? departure_time,
          String? stop_id,
          int? stop_sequence,
          int? stop_headsign,
          int? pickup_type,
          int? drop_off_type,
          int? continuous_pickup,
          int? continuous_drop_off,
          double? shape_dist_traveled,
          int? timepoint}) =>
      StopTime(
        trip_id: trip_id ?? this.trip_id,
        arrival_time: arrival_time ?? this.arrival_time,
        departure_time: departure_time ?? this.departure_time,
        stop_id: stop_id ?? this.stop_id,
        stop_sequence: stop_sequence ?? this.stop_sequence,
        stop_headsign: stop_headsign ?? this.stop_headsign,
        pickup_type: pickup_type ?? this.pickup_type,
        drop_off_type: drop_off_type ?? this.drop_off_type,
        continuous_pickup: continuous_pickup ?? this.continuous_pickup,
        continuous_drop_off: continuous_drop_off ?? this.continuous_drop_off,
        shape_dist_traveled: shape_dist_traveled ?? this.shape_dist_traveled,
        timepoint: timepoint ?? this.timepoint,
      );
  @override
  String toString() {
    return (StringBuffer('StopTime(')
          ..write('trip_id: $trip_id, ')
          ..write('arrival_time: $arrival_time, ')
          ..write('departure_time: $departure_time, ')
          ..write('stop_id: $stop_id, ')
          ..write('stop_sequence: $stop_sequence, ')
          ..write('stop_headsign: $stop_headsign, ')
          ..write('pickup_type: $pickup_type, ')
          ..write('drop_off_type: $drop_off_type, ')
          ..write('continuous_pickup: $continuous_pickup, ')
          ..write('continuous_drop_off: $continuous_drop_off, ')
          ..write('shape_dist_traveled: $shape_dist_traveled, ')
          ..write('timepoint: $timepoint')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      trip_id,
      arrival_time,
      departure_time,
      stop_id,
      stop_sequence,
      stop_headsign,
      pickup_type,
      drop_off_type,
      continuous_pickup,
      continuous_drop_off,
      shape_dist_traveled,
      timepoint);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StopTime &&
          other.trip_id == this.trip_id &&
          other.arrival_time == this.arrival_time &&
          other.departure_time == this.departure_time &&
          other.stop_id == this.stop_id &&
          other.stop_sequence == this.stop_sequence &&
          other.stop_headsign == this.stop_headsign &&
          other.pickup_type == this.pickup_type &&
          other.drop_off_type == this.drop_off_type &&
          other.continuous_pickup == this.continuous_pickup &&
          other.continuous_drop_off == this.continuous_drop_off &&
          other.shape_dist_traveled == this.shape_dist_traveled &&
          other.timepoint == this.timepoint);
}

class StopTimesCompanion extends UpdateCompanion<StopTime> {
  final Value<String> trip_id;
  final Value<String> arrival_time;
  final Value<String> departure_time;
  final Value<String> stop_id;
  final Value<int> stop_sequence;
  final Value<int?> stop_headsign;
  final Value<int?> pickup_type;
  final Value<int?> drop_off_type;
  final Value<int?> continuous_pickup;
  final Value<int?> continuous_drop_off;
  final Value<double?> shape_dist_traveled;
  final Value<int?> timepoint;
  const StopTimesCompanion({
    this.trip_id = const Value.absent(),
    this.arrival_time = const Value.absent(),
    this.departure_time = const Value.absent(),
    this.stop_id = const Value.absent(),
    this.stop_sequence = const Value.absent(),
    this.stop_headsign = const Value.absent(),
    this.pickup_type = const Value.absent(),
    this.drop_off_type = const Value.absent(),
    this.continuous_pickup = const Value.absent(),
    this.continuous_drop_off = const Value.absent(),
    this.shape_dist_traveled = const Value.absent(),
    this.timepoint = const Value.absent(),
  });
  StopTimesCompanion.insert({
    required String trip_id,
    required String arrival_time,
    required String departure_time,
    required String stop_id,
    required int stop_sequence,
    this.stop_headsign = const Value.absent(),
    this.pickup_type = const Value.absent(),
    this.drop_off_type = const Value.absent(),
    this.continuous_pickup = const Value.absent(),
    this.continuous_drop_off = const Value.absent(),
    this.shape_dist_traveled = const Value.absent(),
    this.timepoint = const Value.absent(),
  })  : trip_id = Value(trip_id),
        arrival_time = Value(arrival_time),
        departure_time = Value(departure_time),
        stop_id = Value(stop_id),
        stop_sequence = Value(stop_sequence);
  static Insertable<StopTime> custom({
    Expression<String>? trip_id,
    Expression<String>? arrival_time,
    Expression<String>? departure_time,
    Expression<String>? stop_id,
    Expression<int>? stop_sequence,
    Expression<int?>? stop_headsign,
    Expression<int?>? pickup_type,
    Expression<int?>? drop_off_type,
    Expression<int?>? continuous_pickup,
    Expression<int?>? continuous_drop_off,
    Expression<double?>? shape_dist_traveled,
    Expression<int?>? timepoint,
  }) {
    return RawValuesInsertable({
      if (trip_id != null) 'trip_id': trip_id,
      if (arrival_time != null) 'arrival_time': arrival_time,
      if (departure_time != null) 'departure_time': departure_time,
      if (stop_id != null) 'stop_id': stop_id,
      if (stop_sequence != null) 'stop_sequence': stop_sequence,
      if (stop_headsign != null) 'stop_headsign': stop_headsign,
      if (pickup_type != null) 'pickup_type': pickup_type,
      if (drop_off_type != null) 'drop_off_type': drop_off_type,
      if (continuous_pickup != null) 'continuous_pickup': continuous_pickup,
      if (continuous_drop_off != null)
        'continuous_drop_off': continuous_drop_off,
      if (shape_dist_traveled != null)
        'shape_dist_traveled': shape_dist_traveled,
      if (timepoint != null) 'timepoint': timepoint,
    });
  }

  StopTimesCompanion copyWith(
      {Value<String>? trip_id,
      Value<String>? arrival_time,
      Value<String>? departure_time,
      Value<String>? stop_id,
      Value<int>? stop_sequence,
      Value<int?>? stop_headsign,
      Value<int?>? pickup_type,
      Value<int?>? drop_off_type,
      Value<int?>? continuous_pickup,
      Value<int?>? continuous_drop_off,
      Value<double?>? shape_dist_traveled,
      Value<int?>? timepoint}) {
    return StopTimesCompanion(
      trip_id: trip_id ?? this.trip_id,
      arrival_time: arrival_time ?? this.arrival_time,
      departure_time: departure_time ?? this.departure_time,
      stop_id: stop_id ?? this.stop_id,
      stop_sequence: stop_sequence ?? this.stop_sequence,
      stop_headsign: stop_headsign ?? this.stop_headsign,
      pickup_type: pickup_type ?? this.pickup_type,
      drop_off_type: drop_off_type ?? this.drop_off_type,
      continuous_pickup: continuous_pickup ?? this.continuous_pickup,
      continuous_drop_off: continuous_drop_off ?? this.continuous_drop_off,
      shape_dist_traveled: shape_dist_traveled ?? this.shape_dist_traveled,
      timepoint: timepoint ?? this.timepoint,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trip_id.present) {
      map['trip_id'] = Variable<String>(trip_id.value);
    }
    if (arrival_time.present) {
      map['arrival_time'] = Variable<String>(arrival_time.value);
    }
    if (departure_time.present) {
      map['departure_time'] = Variable<String>(departure_time.value);
    }
    if (stop_id.present) {
      map['stop_id'] = Variable<String>(stop_id.value);
    }
    if (stop_sequence.present) {
      map['stop_sequence'] = Variable<int>(stop_sequence.value);
    }
    if (stop_headsign.present) {
      map['stop_headsign'] = Variable<int?>(stop_headsign.value);
    }
    if (pickup_type.present) {
      map['pickup_type'] = Variable<int?>(pickup_type.value);
    }
    if (drop_off_type.present) {
      map['drop_off_type'] = Variable<int?>(drop_off_type.value);
    }
    if (continuous_pickup.present) {
      map['continuous_pickup'] = Variable<int?>(continuous_pickup.value);
    }
    if (continuous_drop_off.present) {
      map['continuous_drop_off'] = Variable<int?>(continuous_drop_off.value);
    }
    if (shape_dist_traveled.present) {
      map['shape_dist_traveled'] = Variable<double?>(shape_dist_traveled.value);
    }
    if (timepoint.present) {
      map['timepoint'] = Variable<int?>(timepoint.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StopTimesCompanion(')
          ..write('trip_id: $trip_id, ')
          ..write('arrival_time: $arrival_time, ')
          ..write('departure_time: $departure_time, ')
          ..write('stop_id: $stop_id, ')
          ..write('stop_sequence: $stop_sequence, ')
          ..write('stop_headsign: $stop_headsign, ')
          ..write('pickup_type: $pickup_type, ')
          ..write('drop_off_type: $drop_off_type, ')
          ..write('continuous_pickup: $continuous_pickup, ')
          ..write('continuous_drop_off: $continuous_drop_off, ')
          ..write('shape_dist_traveled: $shape_dist_traveled, ')
          ..write('timepoint: $timepoint')
          ..write(')'))
        .toString();
  }
}

class $StopTimesTable extends StopTimes
    with TableInfo<$StopTimesTable, StopTime> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StopTimesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _trip_idMeta = const VerificationMeta('trip_id');
  @override
  late final GeneratedColumn<String?> trip_id = GeneratedColumn<String?>(
      'trip_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES trips (trip_id)');
  final VerificationMeta _arrival_timeMeta =
      const VerificationMeta('arrival_time');
  @override
  late final GeneratedColumn<String?> arrival_time = GeneratedColumn<String?>(
      'arrival_time', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _departure_timeMeta =
      const VerificationMeta('departure_time');
  @override
  late final GeneratedColumn<String?> departure_time = GeneratedColumn<String?>(
      'departure_time', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stop_idMeta = const VerificationMeta('stop_id');
  @override
  late final GeneratedColumn<String?> stop_id = GeneratedColumn<String?>(
      'stop_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES stops (stop_id)');
  final VerificationMeta _stop_sequenceMeta =
      const VerificationMeta('stop_sequence');
  @override
  late final GeneratedColumn<int?> stop_sequence = GeneratedColumn<int?>(
      'stop_sequence', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _stop_headsignMeta =
      const VerificationMeta('stop_headsign');
  @override
  late final GeneratedColumn<int?> stop_headsign = GeneratedColumn<int?>(
      'stop_headsign', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _pickup_typeMeta =
      const VerificationMeta('pickup_type');
  @override
  late final GeneratedColumn<int?> pickup_type = GeneratedColumn<int?>(
      'pickup_type', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _drop_off_typeMeta =
      const VerificationMeta('drop_off_type');
  @override
  late final GeneratedColumn<int?> drop_off_type = GeneratedColumn<int?>(
      'drop_off_type', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _continuous_pickupMeta =
      const VerificationMeta('continuous_pickup');
  @override
  late final GeneratedColumn<int?> continuous_pickup = GeneratedColumn<int?>(
      'continuous_pickup', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _continuous_drop_offMeta =
      const VerificationMeta('continuous_drop_off');
  @override
  late final GeneratedColumn<int?> continuous_drop_off = GeneratedColumn<int?>(
      'continuous_drop_off', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _shape_dist_traveledMeta =
      const VerificationMeta('shape_dist_traveled');
  @override
  late final GeneratedColumn<double?> shape_dist_traveled =
      GeneratedColumn<double?>('shape_dist_traveled', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _timepointMeta = const VerificationMeta('timepoint');
  @override
  late final GeneratedColumn<int?> timepoint = GeneratedColumn<int?>(
      'timepoint', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        trip_id,
        arrival_time,
        departure_time,
        stop_id,
        stop_sequence,
        stop_headsign,
        pickup_type,
        drop_off_type,
        continuous_pickup,
        continuous_drop_off,
        shape_dist_traveled,
        timepoint
      ];
  @override
  String get aliasedName => _alias ?? 'stop_times';
  @override
  String get actualTableName => 'stop_times';
  @override
  VerificationContext validateIntegrity(Insertable<StopTime> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('trip_id')) {
      context.handle(_trip_idMeta,
          trip_id.isAcceptableOrUnknown(data['trip_id']!, _trip_idMeta));
    } else if (isInserting) {
      context.missing(_trip_idMeta);
    }
    if (data.containsKey('arrival_time')) {
      context.handle(
          _arrival_timeMeta,
          arrival_time.isAcceptableOrUnknown(
              data['arrival_time']!, _arrival_timeMeta));
    } else if (isInserting) {
      context.missing(_arrival_timeMeta);
    }
    if (data.containsKey('departure_time')) {
      context.handle(
          _departure_timeMeta,
          departure_time.isAcceptableOrUnknown(
              data['departure_time']!, _departure_timeMeta));
    } else if (isInserting) {
      context.missing(_departure_timeMeta);
    }
    if (data.containsKey('stop_id')) {
      context.handle(_stop_idMeta,
          stop_id.isAcceptableOrUnknown(data['stop_id']!, _stop_idMeta));
    } else if (isInserting) {
      context.missing(_stop_idMeta);
    }
    if (data.containsKey('stop_sequence')) {
      context.handle(
          _stop_sequenceMeta,
          stop_sequence.isAcceptableOrUnknown(
              data['stop_sequence']!, _stop_sequenceMeta));
    } else if (isInserting) {
      context.missing(_stop_sequenceMeta);
    }
    if (data.containsKey('stop_headsign')) {
      context.handle(
          _stop_headsignMeta,
          stop_headsign.isAcceptableOrUnknown(
              data['stop_headsign']!, _stop_headsignMeta));
    }
    if (data.containsKey('pickup_type')) {
      context.handle(
          _pickup_typeMeta,
          pickup_type.isAcceptableOrUnknown(
              data['pickup_type']!, _pickup_typeMeta));
    }
    if (data.containsKey('drop_off_type')) {
      context.handle(
          _drop_off_typeMeta,
          drop_off_type.isAcceptableOrUnknown(
              data['drop_off_type']!, _drop_off_typeMeta));
    }
    if (data.containsKey('continuous_pickup')) {
      context.handle(
          _continuous_pickupMeta,
          continuous_pickup.isAcceptableOrUnknown(
              data['continuous_pickup']!, _continuous_pickupMeta));
    }
    if (data.containsKey('continuous_drop_off')) {
      context.handle(
          _continuous_drop_offMeta,
          continuous_drop_off.isAcceptableOrUnknown(
              data['continuous_drop_off']!, _continuous_drop_offMeta));
    }
    if (data.containsKey('shape_dist_traveled')) {
      context.handle(
          _shape_dist_traveledMeta,
          shape_dist_traveled.isAcceptableOrUnknown(
              data['shape_dist_traveled']!, _shape_dist_traveledMeta));
    }
    if (data.containsKey('timepoint')) {
      context.handle(_timepointMeta,
          timepoint.isAcceptableOrUnknown(data['timepoint']!, _timepointMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trip_id, stop_id, stop_sequence};
  @override
  StopTime map(Map<String, dynamic> data, {String? tablePrefix}) {
    return StopTime.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $StopTimesTable createAlias(String alias) {
    return $StopTimesTable(attachedDatabase, alias);
  }
}

class CalendarDate extends DataClass implements Insertable<CalendarDate> {
  final String service_id;
  final DateTime date;
  final int exception_type;
  CalendarDate(
      {required this.service_id,
      required this.date,
      required this.exception_type});
  factory CalendarDate.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CalendarDate(
      service_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}service_id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      exception_type: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exception_type'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['service_id'] = Variable<String>(service_id);
    map['date'] = Variable<DateTime>(date);
    map['exception_type'] = Variable<int>(exception_type);
    return map;
  }

  CalendarDatesCompanion toCompanion(bool nullToAbsent) {
    return CalendarDatesCompanion(
      service_id: Value(service_id),
      date: Value(date),
      exception_type: Value(exception_type),
    );
  }

  factory CalendarDate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarDate(
      service_id: serializer.fromJson<String>(json['service_id']),
      date: serializer.fromJson<DateTime>(json['date']),
      exception_type: serializer.fromJson<int>(json['exception_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'service_id': serializer.toJson<String>(service_id),
      'date': serializer.toJson<DateTime>(date),
      'exception_type': serializer.toJson<int>(exception_type),
    };
  }

  CalendarDate copyWith(
          {String? service_id, DateTime? date, int? exception_type}) =>
      CalendarDate(
        service_id: service_id ?? this.service_id,
        date: date ?? this.date,
        exception_type: exception_type ?? this.exception_type,
      );
  @override
  String toString() {
    return (StringBuffer('CalendarDate(')
          ..write('service_id: $service_id, ')
          ..write('date: $date, ')
          ..write('exception_type: $exception_type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(service_id, date, exception_type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarDate &&
          other.service_id == this.service_id &&
          other.date == this.date &&
          other.exception_type == this.exception_type);
}

class CalendarDatesCompanion extends UpdateCompanion<CalendarDate> {
  final Value<String> service_id;
  final Value<DateTime> date;
  final Value<int> exception_type;
  const CalendarDatesCompanion({
    this.service_id = const Value.absent(),
    this.date = const Value.absent(),
    this.exception_type = const Value.absent(),
  });
  CalendarDatesCompanion.insert({
    required String service_id,
    required DateTime date,
    required int exception_type,
  })  : service_id = Value(service_id),
        date = Value(date),
        exception_type = Value(exception_type);
  static Insertable<CalendarDate> custom({
    Expression<String>? service_id,
    Expression<DateTime>? date,
    Expression<int>? exception_type,
  }) {
    return RawValuesInsertable({
      if (service_id != null) 'service_id': service_id,
      if (date != null) 'date': date,
      if (exception_type != null) 'exception_type': exception_type,
    });
  }

  CalendarDatesCompanion copyWith(
      {Value<String>? service_id,
      Value<DateTime>? date,
      Value<int>? exception_type}) {
    return CalendarDatesCompanion(
      service_id: service_id ?? this.service_id,
      date: date ?? this.date,
      exception_type: exception_type ?? this.exception_type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (service_id.present) {
      map['service_id'] = Variable<String>(service_id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (exception_type.present) {
      map['exception_type'] = Variable<int>(exception_type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarDatesCompanion(')
          ..write('service_id: $service_id, ')
          ..write('date: $date, ')
          ..write('exception_type: $exception_type')
          ..write(')'))
        .toString();
  }
}

class $CalendarDatesTable extends CalendarDates
    with TableInfo<$CalendarDatesTable, CalendarDate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarDatesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _service_idMeta = const VerificationMeta('service_id');
  @override
  late final GeneratedColumn<String?> service_id = GeneratedColumn<String?>(
      'service_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES calendar (service_id)');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _exception_typeMeta =
      const VerificationMeta('exception_type');
  @override
  late final GeneratedColumn<int?> exception_type = GeneratedColumn<int?>(
      'exception_type', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [service_id, date, exception_type];
  @override
  String get aliasedName => _alias ?? 'calendar_dates';
  @override
  String get actualTableName => 'calendar_dates';
  @override
  VerificationContext validateIntegrity(Insertable<CalendarDate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('service_id')) {
      context.handle(
          _service_idMeta,
          service_id.isAcceptableOrUnknown(
              data['service_id']!, _service_idMeta));
    } else if (isInserting) {
      context.missing(_service_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('exception_type')) {
      context.handle(
          _exception_typeMeta,
          exception_type.isAcceptableOrUnknown(
              data['exception_type']!, _exception_typeMeta));
    } else if (isInserting) {
      context.missing(_exception_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {service_id, date};
  @override
  CalendarDate map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CalendarDate.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CalendarDatesTable createAlias(String alias) {
    return $CalendarDatesTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $StopsTable stops = $StopsTable(this);
  late final $TransitRoutesTable transitRoutes = $TransitRoutesTable(this);
  late final $CalendarTable calendar = $CalendarTable(this);
  late final $ShapesTable shapes = $ShapesTable(this);
  late final $TripsTable trips = $TripsTable(this);
  late final $StopTimesTable stopTimes = $StopTimesTable(this);
  late final $CalendarDatesTable calendarDates = $CalendarDatesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [stops, transitRoutes, calendar, shapes, trips, stopTimes, calendarDates];
}
