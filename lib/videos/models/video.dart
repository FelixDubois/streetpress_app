import 'dart:convert';

import 'package:streetpress/authors/models/author.dart';

class Video {
  String vid;

  String title;
  String subTitle;

  String imageUrl;

  String content;

  List<Author> authors = [];

  DateTime date;

  String? duration;

  String alias;

  String? youtubeId;

  String json;

  Video({
    required this.vid,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.content,
    required this.authors,
    required this.date,
    required this.duration,
    required this.alias,
    required this.youtubeId,
    required this.json,
  });

  factory Video.fromJson(json) {
    return Video(
      vid: json['vid'],
      title: json['title'],
      subTitle: json['soustitre'],
      imageUrl: json['realpathpicture'],
      content: "null",
      authors: (json['auteurs'] as List<dynamic>)
          .map((e) => Author.fromJson(e))
          .toList(),
      date: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['changed']) * 1000),
      duration: getVideoDuration(json),
      alias: json['alias'],
      youtubeId: getVideoYoutubeId(json),
      json: jsonEncode(json),
    );
  }

  Map<String, dynamic> toJson() => {
        'vid': vid,
        'title': title,
        'subtitle': subTitle,
        'imageUrl': imageUrl,
        'content': content,
        'authors': authors,
        'date': date,
        'duration': duration,
        'alias': alias,
        'youtubeId': youtubeId,
      };
}

String? getVideoDuration(json) {
  try {
    return json['video']['field_duree']['und'][0]['value'];
  } catch (e) {
    return null;
  }
}

String? getVideoYoutubeId(json) {
  try {
    return json['video']['field_youtube_id']['und'][0]['value'];
  } catch (e) {
    return null;
  }
}
