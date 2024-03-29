import 'dart:convert';

import 'package:streetpress/authors/models/author.dart';

class Article {
  String vid;

  String title;
  String subTitle;

  // Random image by default
  String imageUrl;

  String content;

  List<Author> authors = [];

  DateTime date;

  String alias;

  String json;

  Article({
    required this.vid,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.content,
    required this.authors,
    required this.date,
    required this.alias,
    required this.json,
  });

  factory Article.fromJson(json) {
    return Article(
      vid: json['vid'],
      title: json['title'],
      subTitle: json['soustitre'],
      imageUrl: json['realpathpicture'],
      content: "null",
      authors: (json['auteurs'] as List<dynamic>)
          .map((e) => Author.fromJson(e))
          .toList(),
      /* [auth.map((e) => Author.fromJson(e)).toList()],*/
      date: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['changed']) * 1000),
      alias: json['alias'],
      json: jsonEncode(json),
    );
  }

  Map<String, dynamic> toJson() => {
        'vid': vid,
        'title': title,
        'subtitle': subTitle,
        'imageUrl': imageUrl,
        'content': content,
        'authors':
            authors.map<Map<String, dynamic>>((e) => e.toJson()).toList(),
        'date': date,
        'alias': alias,
      };
}
