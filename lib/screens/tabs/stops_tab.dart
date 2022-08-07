import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/database/db.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';

class StopsTab extends StatelessWidget {
  const StopsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase.get(context);

    return AppFutureBuilder<List<Stop>>(
      future: database.selectAllStops(),
      builder: (BuildContext context, stops) {
        return ListView.separated(
          itemCount: stops.length,
          separatorBuilder: (context, i) => Divider(),
          itemBuilder: (context, index) {
            final stop = stops[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  MdiIcons.busStop,
                  color: Colors.white,
                ),
              ),
              title: Text(stop.stop_name),
              subtitle: Text(stop.stop_desc ?? ''),
            );
          },
        );
      },
    );
  }
}
