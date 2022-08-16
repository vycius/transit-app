import 'package:flutter/material.dart';
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
      icon: Icons.near_me,
      label: 'Artimiausios',
    ),
    _HomeScreenTab(
      builder: () => MapTab(),
      icon: Icons.pin_drop,
      label: 'Stotelės',
    ),
    _HomeScreenTab(
      builder: () => RealtimeTab(),
      icon: Icons.directions_bus,
      label: 'Realus laikas',
    ),
    _HomeScreenTab(
      builder: () => const RoutesTab(),
      icon: Icons.route_outlined,
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
