import 'package:flutter/material.dart';

class ArticleTile extends StatefulWidget {
  const ArticleTile({super.key});

  @override
  State<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: const [
          Image(
            image: NetworkImage("https://picsum.photos/500/250"),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
