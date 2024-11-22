class DumpingReport {
  final String location;
  final String issue;
  final String description;
  final List<String> imagePaths;
  String status; // New status field

  DumpingReport({
    required this.location,
    required this.issue,
    required this.description,
    required this.imagePaths,
    this.status = "Pending", // Default value for status
  });
}
