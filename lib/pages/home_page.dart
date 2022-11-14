import 'package:flutter/material.dart';
import 'package:streetpress/articles/models/article.dart';
import 'package:streetpress/articles/services/fetch_articles.dart';
import 'package:streetpress/articles/widgets/article_tile.dart';
import 'package:streetpress/themes/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> futureArticles;
  List<Article> fetchedArticles = [];

  var page = 0;
  ScrollController controller = ScrollController();

  void _scrollListener() {
    // When the user scrolls to the bottom of the page, fetch more articles
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      fetchArticles(page + 1).then(
        (value) => {
          fetchedArticles.addAll(value),
          setState(() {
            page++;
            futureArticles = Future.value(fetchedArticles);
          })
        },
      );
    }
  }

  void scrollToTop() {
    controller.animateTo(0,
        duration: const Duration(milliseconds: 1000), curve: Curves.decelerate);
  }

  @override
  void initState() {
    super.initState();

    controller.addListener(_scrollListener);

    futureArticles = fetchArticles(page);
    futureArticles.then((value) => fetchedArticles = value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: StreetPressColors.yellow,
      child: Center(
        child: FutureBuilder<List<Article>>(
          future: futureArticles,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scrollbar(
                child: ListView.builder(
                  controller: controller,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ArticleTile(
                      article: snapshot.data![index],
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
