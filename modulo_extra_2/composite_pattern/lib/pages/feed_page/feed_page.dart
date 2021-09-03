import 'package:composite_pattern/feeds/feed.dart';
import 'package:composite_pattern/feeds/ifeed.dart';
import 'package:composite_pattern/feeds/image_feed.dart';
import 'package:composite_pattern/feeds/propaganda_feed.dart';
import 'package:composite_pattern/feeds/youtube_feed.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({
    Key? key 
  }) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late List<IFeed> _pages;

  @override 
  void initState() {
    super.initState();

    _pages = [
      Feed(
        text: 'Notícia 1',
      ),
      ImageFeed(
        text: 'Notícia 2',
        url: 'https://i0.hippopx.com/photos/749/574/438/clouds-cloudscape-hd-wallpaper-nature-preview.jpg'
      ),
      YoutubeFeed(
        playerID: 'd-mJgZvJ7f0',
        text: 'Notícia 3'
      ),
      PropagandaFeed(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notícias'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _pages.length,
              itemBuilder: (_, index) => _pages[index].render(),
            ),
          ),
        ],
      ),
    );
  }
}