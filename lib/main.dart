import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:archive/archive_io.dart';
import 'package:provider/provider.dart';
import 'package:transit/database/connection/connection.dart';
import 'package:transit/database/db.dart' as db;
import 'package:transit/gtfs_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<db.AppDatabase>(
      create: (context) => constructDb(),
      dispose: (context, db) => db.close(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Future<List<db.Route>> _requst() async {
    // https://stops.lt/vilnius/vilnius/gtfs.zip
    String allowCORSEndPoint = "https://api.allorigins.win/raw?url=";

    var url = Uri.parse(
        '${allowCORSEndPoint}http://stops.lt/vilnius/vilnius/gtfs.zip');

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    final database = Provider.of<db.AppDatabase>(
      context,
      listen: false,
    );

    final archive = ZipDecoder().decodeBytes(
      response.bodyBytes,
      verify: true,
    );

    await GTFSImportService().insertGTFSArchive(archive, database);

    return database.selectAllRoutes();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder<List<db.Route>>(
          future: _requst(), // a previously-obtained Future<String> or null
          builder: (context, snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              final routes = snapshot.requireData;
              return ListView.builder(
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  final route = routes[index];

                  final shortName = route.route_short_name ?? '';

                  return ListTile(
                    title: Text(route.route_long_name),
                    leading: CircleAvatar(
                      child: Text(shortName),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}
