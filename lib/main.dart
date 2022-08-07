import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transit/database/connection/connection.dart';
import 'package:transit/database/db.dart';
import 'package:transit/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>(
      create: (context) => constructDb(),
      dispose: (context, db) => db.close(),
      child: MaterialApp(
        title: 'Transit',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: NavigationRoutes.regionHome,
        onGenerateRoute: NavigationRoutes.onGenerateRoute,
      ),
    );
  }
}
