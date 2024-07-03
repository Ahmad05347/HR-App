class TemplatesItems {
  const TemplatesItems(
      {required this.categories,
      required this.durations,
      required this.id,
      required this.imageURL,
      required this.isFreetemplates,
      required this.isPaidTemplates,
      required this.title});

  final String id;
  final String imageURL;
  final String title;
  final List<String> categories;
  final int durations;
  final bool isFreetemplates;
  final bool isPaidTemplates;
}
