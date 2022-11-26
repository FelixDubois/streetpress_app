import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:streetpress/videos/models/video.dart';

const fetchSize = 5;

Future<List<Video>> fetchVideos(page) async {
  var url =
      'https://backend.streetpress.com/api/v2/sujets/rub?page=$page&nitems=$fetchSize&tag=15310';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    //print("Get ok");
    List<dynamic> list = jsonDecode(response.body);
    return list.map((e) => Video.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load videos');
  }
}
