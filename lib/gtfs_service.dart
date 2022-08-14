import 'package:gtfs_realtime_bindings/gtfs_realtime_bindings.dart';
import 'package:http/http.dart' as http;
import 'package:transit/models/region.dart';

class GTFSRealtimeService {
  Future<FeedMessage> fetchGtfRealtime(Region region) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final url = '${region.gtfsRealtimeUrl}?time=$timestamp';
    final response = await http.get(Uri.parse(url));
    final message = FeedMessage.fromBuffer(response.bodyBytes);

    return message;
  }

  Stream<FeedMessage> streamGtfsRealtime(Region region) async* {
    yield await fetchGtfRealtime(region);

    yield* Stream.periodic(Duration(seconds: 10)).asyncMap<FeedMessage>(
      (e) => fetchGtfRealtime(region),
    );
  }
}
