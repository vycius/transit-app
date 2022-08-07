class Region {
  final String name;
  final String gtfsUrl;
  final bool corsHackRequired;

  const Region({
    required this.name,
    required this.gtfsUrl,
    this.corsHackRequired = true,
  });
}
