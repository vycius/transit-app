import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/gtfs_service.dart';
import 'package:transit/models/realtime/gtfs-realtime.pb.dart';
import 'package:transit/screens/region_selector_screen.dart';

class RealtimeTab extends StatelessWidget {
  const RealtimeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final region = RegionSelectorScreen.regions.first;

    return StreamBuilder<FeedMessage>(
      stream: GTFSImportService().streamGtfsRealtime(region),
      builder: (context, snapshot) {
        var vehicles = <VehiclePosition>[];
        if (snapshot.hasData) {
          vehicles = snapshot.requireData.entity
              .where((e) => e.hasVehicle())
              .map((e) => e.vehicle)
              .toList();
        }

        return FlutterMap(
          options: MapOptions(
            center: LatLng(54.68916, 25.2798),
            plugins: [
              LocationMarkerPlugin(),
            ],
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'lt.transit.transit',
            ),
            LocationMarkerLayerOptions(),
            MarkerLayerOptions(
              markers: [
                for (final vehicle in vehicles)
                  Marker(
                    key: Key('vehicle-${vehicle.vehicle.id}'),
                    point: LatLng(
                      vehicle.position.latitude,
                      vehicle.position.longitude,
                    ),
                    anchorPos: AnchorPos.align(AnchorAlign.center),
                    width: 25,
                    height: 25,
                    builder: (context) => FloatingActionButton.small(
                      onPressed: null,
                      backgroundColor: Colors.teal,
                      heroTag: null,
                      child: Icon(
                        MdiIcons.bus,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
              ],
            ),
          ],
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
            ),
          ],
        );
      },
    );
  }
}
