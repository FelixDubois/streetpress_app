// Folder structure : https://medium.com/flutter-community/scalable-folder-structure-for-flutter-applications-183746bdc320
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:device_preview/device_preview.dart';
import 'package:streetpress/bottom_bar/widgets/bottom_bar.dart';
import 'package:streetpress/pages/bookmark_page.dart';
import 'package:streetpress/pages/home_page.dart';
import 'package:streetpress/pages/money_page.dart';
import 'package:streetpress/pages/videos_page.dart';
import 'package:streetpress/top_bar/widgets/top_bar.dart';

Future<void> main() async {
  // Force the portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    DevicePreview(
        enabled: false,
        tools: const [...DevicePreview.defaultTools],
        builder: (context) => MyApp()),
  );
}

List<Widget> pages = const [
  HomePage(),
  VideoPage(),
  //Center(child: Text('Search')),
  BookmarkPage(),
  MoneyPage(),
];

class MyApp extends StatefulWidget {
  final PageController pageController = PageController(initialPage: 0);

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreetPress',
      theme: ThemeData(
        //primarySwatch: const MaterialColor(0, {0: yellow}),
        fontFamily: "SuisseIntl",
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56.0),
            child: TopBar(),
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: widget.pageController,
            children: pages,
          ),
          bottomNavigationBar: BottomBar(pageController: widget.pageController),
        ),
      ),
    );
  }
}
