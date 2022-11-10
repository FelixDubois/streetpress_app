import '../../authors/models/author.dart';

class Article {
  String title = 'No title';
  String subTitle = 'No subtitle';

  // Random image by default
  String imageUrl = 'https://picsum.photos/500/250';

  String content = "No content";

  List<Author> authors = [];

  Article({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.content,
    required this.authors,
  });
}
