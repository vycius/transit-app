import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transit/database/db.dart';
import 'package:transit/routes.dart';
import 'package:transit/screens/tabs/routes_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<_HomeScreenTab> _tabs = [
    _HomeScreenTab(
      builder: () => const RoutesTab(),
      icon: Icons.route_outlined,
      label: 'Maršrutai',
    ),
    _HomeScreenTab(
      builder: () => Container(),
      icon: MdiIcons.busStop,
      label: 'Stotelės',
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
