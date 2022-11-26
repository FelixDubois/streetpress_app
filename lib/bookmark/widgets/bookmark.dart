import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'package:streetpress/bookmark/services/bookmark.dart';
import 'package:streetpress/themes/color.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton(
      {super.key, required String vid, required this.json, required this.type})
      : _vid = vid;

  final String _vid;
  final String json;
  final Type type;

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();

    Bookmark.isSaved(widget._vid).then(
      (value) => setState(
        () => isSaved = value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: (() async {
        if (isSaved) {
          Bookmark.remove(widget._vid);
        } else {
          Bookmark.save(widget._vid, widget.json, widget.type);
        }

        bool u = await Bookmark.isSaved(widget._vid);
        setState(() {
          isSaved = u;
        });
      }),
      icon: DecoratedIcon(
        decoration: const IconDecoration(
          border: IconBorder(width: 1.0, color: StreetPressColors.black),
        ),
        icon: isSaved ? savedIcon() : notSavedIcon(),
      ),
    );
  }

  Icon notSavedIcon() {
    return const Icon(
      Icons.bookmark_add_outlined,
      color: StreetPressColors.yellow,
    );
  }

  Icon savedIcon() {
    return const Icon(
      Icons.bookmark,
      color: StreetPressColors.yellow,
    );
  }
}
