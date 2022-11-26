import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streetpress/articles/models/article.dart';
import 'package:streetpress/articles/widgets/article_tile.dart';
import 'package:streetpress/themes/color.dart';
import 'package:streetpress/videos/models/video.dart';
import 'package:streetpress/videos/widgets/video_tile.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Widget>> getAllPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs
        .getKeys()
        .map<Widget>((key) => ListTile(
              title: Text(key),
              subtitle: Text(prefs.get(key).toString()),
            ))
        .toList(growable: false);
  }

  Future<List<Widget>> getSavedArtVid() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> s = prefs.getStringList("saved") ?? [];
    List<Widget> l = [];

    for (String key in s) {
      List<String> e = prefs.getStringList(key) ?? [];
      if (e.isNotEmpty) {
        if (e[0] == "article") {
          l.add(ArticleTile(article: Article.fromJson(jsonDecode(e[1]))));
        } else if (e[0] == "video") {
          l.add(VideoTile(video: Video.fromJson(jsonDecode(e[1]))));
        }
      }
    }

    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: StreetPressColors.yellow,
      child: Center(
        child: FutureBuilder<List<Widget>>(
          future: getSavedArtVid(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  "Vous n'avez rien enregistré",
                  style: TextStyle(
                    color: StreetPressColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            return ListView(
              children: snapshot.data ?? [],
            );
          },
        ),
      ),
    );
  }
}
