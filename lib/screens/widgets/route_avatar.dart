import 'package:flutter/material.dart';
import 'package:transit/database/db.dart';

class RouteAvatar extends StatelessWidget {
  final TransitRoute route;

  const RouteAvatar({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    final text = route.route_short_name ?? '';
    final routeColorStr = route.route_color;
    final routeTextColorStr = route.route_text_color;

    final routeColor = routeColorStr != null
        ? _convertStringToColor(routeColorStr)
        : Colors.teal;

    final routeTextColor = routeTextColorStr != null
        ? _convertStringToColor(routeTextColorStr)
        : Colors.white;

    return CircleAvatar(
      backgroundColor: routeColor,
      foregroundColor: routeTextColor,
      child: Text(text),
    );
  }

  Color _convertStringToColor(String colorString) {
    var hexColor = colorString;
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }

    throw Exception('Unable to pass color $colorString');
  }
}
