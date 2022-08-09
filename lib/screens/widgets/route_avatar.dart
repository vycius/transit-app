import 'package:flutter/material.dart';
import 'package:transit/database/db.dart';
import 'package:transit/models/extensions.dart';

class RouteAvatar extends StatelessWidget {
  final TransitRoute route;

  const RouteAvatar({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    final text = route.route_short_name ?? '';

    final routeColor = route.routeColor ?? Colors.teal;
    final routeTextColor = route.routeTextColor ?? Colors.white;

    return CircleAvatar(
      backgroundColor: routeColor,
      foregroundColor: routeTextColor,
      child: Text(text),
    );
  }
}
