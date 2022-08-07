class Region {
  final String name;
  final String gtfsUrl;
  final String? gtfsRealtimeUrl;

  const Region({
    required this.name,
    required this.gtfsUrl,
    this.gtfsRealtimeUrl,
  });
}
