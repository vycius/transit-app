import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/database/db.dart';
import 'package:transit/navigation_routes.dart';
import 'package:transit/screens/tabs/map_tab.dart';
import 'package:transit/screens/tabs/realtime_tab.dart';
import 'package:transit/screens/tabs/route_tab.dart';
import 'package:transit/screens/tabs/stops_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<_HomeScreenTab> _tabs = [
    _HomeScreenTab(
      builder: () => StopsTab(),
      icon: MdiIcons.busStop,
      label: 'Artimiausios stotelės',
    ),
    _HomeScreenTab(
      builder: () => const RoutesTab(),
      icon: Icons.route_outlined,
      label: 'Maršrutai',
    ),
    _HomeScreenTab(
      builder: () => MapTab(),
      icon: Icons.map,
      label: 'Stotelių žemėlapis',
    ),
    _HomeScreenTab(
      builder: () => RealtimeTab(),
      icon: MdiIcons.bus,
      label: 'Realus laikas',
    ),
  ];

  _HomeScreenTab get _currentTab => _tabs[_currentIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTab.label),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city),
            tooltip: 'Regionas',
            onPressed: () async {
              await AppDatabase.get(context).deleteEverything();
              // ignore: use_build_context_synchronously
              await Navigator.pushReplacementNamed(
                context,
                NavigationRoutes.routeRegionSelector,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: exportDbInto,
          ),
        ],
      ),
      body: _currentTab.builder(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: [
          for (final tab in _tabs)
            BottomNavigationBarItem(
              label: tab.label,
              icon: Icon(tab.icon),
            ),
        ],
      ),
    );
  }

  Future<void> exportDbInto() async {
    // final directory = await getApplicationDocumentsDirectory();
    // final fullPath = '${directory.path}/vilnius-gtfs.db';
    //
    // final file = File(fullPath)..writeAsBytes(bytes, flush: true);
    //
    // _workbook.dispose();
    //
    // return file;
  }

  void onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }
}

class _HomeScreenTab {
  final String label;
  final Widget Function() builder;
  final IconData icon;

  const _HomeScreenTab({
    required this.label,
    required this.builder,
    required this.icon,
  });
}
