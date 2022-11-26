import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:streetpress/articles/models/article.dart';
import 'package:intl/intl.dart';
import 'package:streetpress/authors/models/author.dart';
import 'package:streetpress/bookmark/services/bookmark.dart';
import 'package:streetpress/bookmark/widgets/bookmark.dart';
import 'package:streetpress/themes/color.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatefulWidget {
  const ArticleTile({super.key, required Article article}) : _article = article;

  final Article _article;

  @override
  State<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Uri url = Uri.parse(
            "https://www.streetpress.com/sujet/${widget._article.alias}");
        launchUrl(url, mode: LaunchMode.externalApplication);
      },
      child: Container(
        width: double.infinity,
        height: 225,
        color: StreetPressColors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            generateBackground(widget._article.imageUrl),
            generateTitle(widget._article.title),
            generateSubtitle(widget._article.subTitle),
            generateDate(widget._article.date),
            generateAuthors(widget._article.authors),
            generateBookmark(widget._article.vid),
          ],
        ),
      ),
    );
  }

  Padding generateBookmark(vid) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.topRight,
        child: BookmarkButton(
          vid: vid,
          json: widget._article.json,
          type: Type.article,
        ),
      ),
    );
  }

  OptimizedCacheImage generateBackground(String imgUrl) {
    return OptimizedCacheImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  StreetPressColors.black.withOpacity(0.3), BlendMode.darken)),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Padding generateTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Padding generateSubtitle(String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          subtitle.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Padding generateDate(DateTime date) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          DateFormat("dd/MM/yyyy").format(date),
          style: const TextStyle(
            color: StreetPressColors.yellow,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Padding generateAuthors(List<Author> authors) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 26),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: authors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  //print("\"" + authors[index].name + "\" clicked");
                },
                child: Text(
                  authors[index].name,
                  style: const TextStyle(
                    color: StreetPressColors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
