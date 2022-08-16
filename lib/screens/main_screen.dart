import 'package:flutter/material.dart';
import 'package:transit/screens/tabs/nearby_stops_tab.dart';
import 'package:transit/screens/tabs/realtime_vehicles_tab.dart';
import 'package:transit/screens/tabs/routes_tab.dart';
import 'package:transit/screens/tabs/stops_map_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<_HomeScreenTab> _tabs = [
    _HomeScreenTab(
      builder: () => NearbyStopsTab(),
      icon: Icons.near_me,
      label: 'Artimiausios',
    ),
    _HomeScreenTab(
      builder: () => StopsMapTab(),
      icon: Icons.pin_drop,
      label: 'Stotelės',
    ),
    _HomeScreenTab(
      builder: () => RealtimeVehiclesTab(),
      icon: Icons.directions_bus,
      label: 'Realus laikas',
    ),
    _HomeScreenTab(
      builder: () => RoutesTab(),
      icon: Icons.route,
      label: 'Maršrutai',
    ),
  ];

  _HomeScreenTab get _currentTab => _tabs[_currentIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTab.label),
        centerTitle: true,
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
