import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum Type { article, video }

class Bookmark {
  static void save(vid, String json, Type t) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> s = prefs.getStringList("saved") ?? [];

    if (!s.contains(vid)) {
      s.insert(0, vid);
    }

    prefs.setStringList("saved", s);
    String type = (t == Type.article)
        ? "article"
        : (t == Type.video)
            ? "video"
            : "error";
    prefs.setStringList(vid, [type, json]);
  }

  static void remove(vid) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> s = prefs.getStringList("saved") ?? [];

    while (s.contains(vid)) {
      s.remove(vid);
    }

    prefs.setStringList("saved", s);
    prefs.remove(vid);
  }

  static Future<bool> isSaved(vid) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> s = prefs.getStringList("saved") ?? [];

    return s.contains(vid);
  }

  read(key) async {
    final prefs = await SharedPreferences.getInstance();

    return json.decode(prefs.getString(key) ?? "");
  }
}
