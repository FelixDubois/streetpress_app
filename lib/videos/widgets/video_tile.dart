import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:intl/intl.dart';
import 'package:streetpress/authors/models/author.dart';
import 'package:streetpress/bookmark/widgets/bookmark.dart';
import 'package:streetpress/bookmark/services/bookmark.dart';
import 'package:streetpress/themes/color.dart';
import 'package:streetpress/videos/models/video.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoTile extends StatefulWidget {
  const VideoTile({super.key, required Video video}) : _video = video;

  final Video _video;

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Uri url = Uri.parse(
            "https://www.streetpress.com/sujet/${widget._video.alias}");
        launchUrl(url, mode: LaunchMode.externalApplication);
      },
      child: Container(
        width: double.infinity,
        height: 225,
        color: StreetPressColors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            generateBackground(widget._video.imageUrl),
            generateTitle(widget._video.title),
            generateSubtitle(widget._video.subTitle),
            generateDate(widget._video.date),
            generateAuthors(widget._video.authors),
            // if widget._video.duration != null return generateDuration(widget._video.duration)
            if (widget._video.duration != null)
              generateDuration(widget._video.duration ?? "0"),

            generateBookmark(widget._video.vid),
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
          json: widget._video.json,
          type: Type.video,
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

  Widget generateAuthors(List<Author> authors) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 26),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(
            authors.length,
            (index) => Padding(
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
            ),
          ),
        ),
      ),
    );
  }

  generateDuration(String duration) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: (() {
          Uri url = Uri.parse(widget._video.youtubeId != null
              ? "https://www.youtube.com/watch?v=${widget._video.youtubeId}"
              : "https://www.streetpress.com/sujet/${widget._video.alias}");
          launchUrl(url, mode: LaunchMode.externalApplication);
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                color: StreetPressColors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 50,
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.play_arrow,
                    size: 30,
                  ),
                ),
                Text(
                  duration,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: StreetPressColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
