import 'package:flutter/material.dart';
import 'package:transit/database/db.dart';
import 'package:transit/gtfs_service.dart';
import 'package:transit/models/region.dart';
import 'package:transit/routes.dart';
import 'package:transit/screens/home_screen.dart';
import 'package:transit/screens/widgets/app_future_loader.dart';

class RegionSelectorScreen extends StatefulWidget {
  RegionSelectorScreen({Key? key}) : super(key: key);

  @override
  State<RegionSelectorScreen> createState() => _RegionSelectorScreenState();
}

class _RegionSelectorScreenState extends State<RegionSelectorScreen> {
  AppDatabase get _database => AppDatabase.get(context);

  Region? _regionToLoad;

  final _regions = const [
    Region(
      name: 'Vilniaus m.',
      gtfsUrl:
          'https://api.allorigins.win/raw?url=http://stops.lt/vilnius/vilnius/gtfs.zip',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pasirinkite regioną'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final region = _regionToLoad;
    if (region == null) {
      return _buildRegionSelector();
    } else {
      return _buildGTFSImport(region);
    }
  }

  Widget _buildRegionSelector() {
    return AppFutureBuilder<bool>(
      future: _hasAnyRoutes(),
      builder: (context, hasAnyRoutes) {
        if (hasAnyRoutes) {
          return HomeScreen();
        }

        return ListView.builder(
          itemCount: _regions.length,
          itemBuilder: (context, index) {
            final region = _regions[index];
            return ListTile(
              title: Text(region.name),
              onTap: () => setState(() => _regionToLoad = region),
            );
          },
        );
      },
    );
  }

  Widget _buildGTFSImport(Region region) {
    return AppFutureBuilder<bool>(
      future: _importRegionGTFS(region),
      builder: (context, success) {
        return Text('Success');
      },
    );
  }

  Future<bool> _hasAnyRoutes() async {
    return (await _database.routesCount()) > 0;
  }

  Future<bool> _importRegionGTFS(Region region) async {
    await GTFSImportService().importRegionGTFS(region, _database);

    if (mounted) {
      await Navigator.pushReplacementNamed(
        context,
        NavigationRoutes.regionHome,
      );
    }
    return true;
  }
}
