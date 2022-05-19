class Apod {
  String copyright;
  String date;
  String explanation;
  String title;
  String url;

  Apod(
      {required this.copyright,
      required this.date,
      required this.explanation,
      required this.title,
      required this.url});

  factory Apod.fromJson(Map<String, dynamic> json) {
    return Apod(
      copyright: json["copyright"].toString(),
      date: json["date"].toString(),
      explanation: json["explanation"].toString(),
      title: json["title"].toString(),
      url: json["url"].toString(),
    );
  }
}
