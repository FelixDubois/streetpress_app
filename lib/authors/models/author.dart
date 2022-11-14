class Author {
  final String url;
  final String name;
  final String imageUrl;
  final String bio = "";
  final List<String> socials = [];

  Author({
    required this.url,
    required this.name,
    required this.imageUrl,
  });

  factory Author.fromJson(json) {
    return Author(
      url: "null",
      name: json['nom'],
      imageUrl: json['realpathpicture'],
    );
  }
}
