import 'package:flutter/material.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:transit/models/db_extensions.dart';

class RouteAvatar extends StatelessWidget {
  final TransitRoute route;

  const RouteAvatar({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    final text = route.route_short_name ?? '';

    final routeColor = route.parsedRouteColor ?? Colors.indigo;
    final routeTextColor = route.parsedRouteTextColor ?? Colors.white;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: routeColor,
      ),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            style: TextStyle(color: routeTextColor),
          ),
        ),
      ),
    );
  }
}
