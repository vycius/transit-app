import 'package:gtfs_realtime_bindings/gtfs_realtime_bindings.dart';
import 'package:http/http.dart' as http;

class GTFSRealtimeService {
  Future<FeedMessage> fetchGtfRealtime(String gtfsRealtimeUrl) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final url = '$gtfsRealtimeUrl?time=$timestamp';
    final response = await http.get(Uri.parse(url));
    final message = FeedMessage.fromBuffer(response.bodyBytes);

    return message;
  }

  Stream<FeedMessage> streamGtfsRealtime(String gtfsRealtimeUrl) async* {
    yield await fetchGtfRealtime(gtfsRealtimeUrl);

    yield* Stream.periodic(Duration(seconds: 10)).asyncMap<FeedMessage>(
      (e) => fetchGtfRealtime(gtfsRealtimeUrl),
    );
  }
}
