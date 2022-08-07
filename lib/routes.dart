import 'package:flutter/material.dart';
import 'package:transit/screens/home_screen.dart';
import 'package:transit/screens/region_selector_screen.dart';

class NavigationRoutes {
  static const routeRegionSelector = 'main';
  static const regionHome = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeRegionSelector:
        return MaterialPageRoute(
          builder: (context) {
            return RegionSelectorScreen();
          },
        );
      case regionHome:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      default:
        throw Exception('Unable to find route ${settings.name} in routes.dart');
    }
  }
}
