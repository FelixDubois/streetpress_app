import '../../authors/models/author.dart';

class Article {
  String title = 'No title';
  String subTitle = 'No subtitle';

  // Random image by default
  String imageUrl = 'https://picsum.photos/500/250';

  String content = "No content";

  List<Author> authors = [];

  DateTime date;

  Article({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.content,
    required this.authors,
    required this.date,
  });

  factory Article.fromJson(json, List<dynamic> auth) {
    return Article(
      title: json['title'],
      subTitle: json['soustitre'],
      imageUrl: json['realpathpicture'],
      content: "null",
      authors: auth.map((e) => Author.fromJson(e)).toList(),
      /* [auth.map((e) => Author.fromJson(e)).toList()],*/
      date: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['changed']) * 1000),
    );
  }
}
