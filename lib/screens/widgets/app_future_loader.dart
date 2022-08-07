import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext context, T data) builder;

  const AppFutureBuilder({
    super.key,
    required this.future,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return builder(context, snapshot.requireData);
        } else if (snapshot.hasError) {
          if (kDebugMode) {
            print('Error while loading future: ${snapshot.error}');
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Klaida kraunant Future: ${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Kraunama...'),
              )
            ],
          ),
        );
      },
    );
  }
}
