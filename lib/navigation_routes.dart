import 'package:flutter/material.dart';
import 'package:gtfs_db/gtfs_db.dart';
import 'package:transit/screens/home_screen.dart';
import 'package:transit/screens/stop_screen.dart';
import 'package:transit/screens/trip/trip_screen.dart';

class NavigationRoutes {
  static const routeHome = 'home';
  static const routeStop = 'stop';
  static const routeTrip = 'trip';

  NavigationRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
      case routeStop:
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
      case routeTrip:
        final arguments = settings.arguments;
        if (arguments != null && arguments is TripScreenArguments) {
          return MaterialPageRoute(
            builder: (context) {
              return TripScreen(argumnets: arguments);
            },
          );
        } else {
          throw Exception('Pass TripScreenArguments to trip screen');
        }
      default:
        throw Exception(
          'Unable to find route ${settings.name} in navigation_routes.dart',
        );
    }
  }
}
