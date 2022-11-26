import 'dart:convert';

import 'package:streetpress/articles/models/article.dart';
import 'package:http/http.dart' as http;

const fetchSize = 5;

Future<List<Article>> fetchArticles(page) async {
  var url =
      'https://backend.streetpress.com/api/v2/sujets/rub?page=$page&nitems=$fetchSize';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<dynamic> list = jsonDecode(response.body);
    return list.map((e) => Article.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load articles');
  }
}
