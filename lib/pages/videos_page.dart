import 'package:flutter/material.dart';
import 'package:streetpress/themes/color.dart';
import 'package:streetpress/videos/models/video.dart';
import 'package:streetpress/videos/services/fetch_videos.dart';
import 'package:streetpress/videos/widgets/video_tile.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with AutomaticKeepAliveClientMixin {
  late Future<List<Video>> futureVideos;
  List<Video> fetchedVideos = [];

  var page = 0;
  ScrollController controller = ScrollController();

  @override
  bool get wantKeepAlive => true;

  void _scrollListener() {
    // When the user scrolls to the bottom of the page, fetch more articles
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      fetchVideos(page + 1).then(
        (value) => {
          fetchedVideos.addAll(value),
          setState(() {
            page++;
            futureVideos = Future.value(fetchedVideos);
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

    futureVideos = fetchVideos(page);
    futureVideos.then((value) => fetchedVideos = value);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: StreetPressColors.yellow,
      child: Center(
        child: FutureBuilder<List<Video>>(
          future: futureVideos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scrollbar(
                child: ListView.builder(
                  controller: controller,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return VideoTile(
                      video: snapshot.data![index],
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
