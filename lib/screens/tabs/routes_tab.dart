import 'package:flutter/material.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:transit/database/database_service.dart';
import 'package:transit/navigation_routes.dart';
import 'package:transit/widgets/app_future_loader.dart';
import 'package:transit/widgets/route_avatar.dart';

class RoutesTab extends StatelessWidget {
  const RoutesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final database = DatabaseService.get(context);

    return AppFutureBuilder(
      future: database.getAllRoutes(),
      builder: (BuildContext context, List<TransitRoute> routes) {
        return ListView.builder(
          itemCount: routes.length,
          itemBuilder: (context, index) {
            return RoutesListTile(route: routes[index]);
          },
        );
      },
    );
  }
}

class RoutesListTile extends StatelessWidget {
  final TransitRoute route;

  const RoutesListTile({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(route.route_long_name),
      leading: RouteAvatar(route: route),
      onTap: () {
        Navigator.pushNamed(
          context,
          NavigatorRoutes.routeRoute,
          arguments: route,
        );
      },
    );
  }
}
