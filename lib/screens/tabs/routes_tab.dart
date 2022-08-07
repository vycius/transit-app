import 'package:flutter/material.dart';
import 'package:transit/database/db.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';

class RoutesTab extends StatelessWidget {
  const RoutesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase.get(context);

    return AppFutureBuilder(
      future: database.selectAllRoutes(),
      builder: (BuildContext context, List<TransitRoute> routes) {
        return ListView.builder(
          itemCount: routes.length,
          itemBuilder: (context, index) {
            final route = routes[index];

            final shortName = route.route_short_name ?? '';

            return ListTile(
              title: Text(route.route_long_name),
              leading: CircleAvatar(
                child: Text(shortName),
              ),
            );
          },
        );
      },
    );
  }
}
