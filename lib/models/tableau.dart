class Tableau {
  const Tableau({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endtime,
    required this.imageString,
  });

  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endtime;
  final String imageString;
}