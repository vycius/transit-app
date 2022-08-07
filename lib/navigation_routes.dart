import 'package:flutter/material.dart';
import 'package:transit/database/db.dart';
import 'package:transit/screens/home_screen.dart';
import 'package:transit/screens/region_selector_screen.dart';
import 'package:transit/screens/stop_screen.dart';

class NavigationRoutes {
  static const routeRegionSelector = 'main';
  static const regionHome = 'home';
  static const stop = 'stop';

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
            return HomeScreen();
          },
        );
      case stop:
        final stop = settings.arguments;
        if (stop != null && stop is Stop) {
          return MaterialPageRoute(
            builder: (context) {
              return StopScreen(stop: stop);
            },
          );
        } else {
          throw Exception('Pass stop to stops screen');
        }
      default:
        throw Exception(
          'Unable to find route ${settings.name} in navigation_routes.dart',
        );
    }
  }
}
