import 'package:composite_pattern/feeds/feed.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeFeed extends Feed {
  final String text;
  final String playerID;
  final YoutubePlayerController _controller;

  YoutubeFeed({
    required this.text,
    required this.playerID,
  }) : _controller = YoutubePlayerController(
    initialVideoId: playerID,
    flags: YoutubePlayerFlags(
      autoPlay: false,
    ),
  ),
  super(text: text);

  @override 
  Widget renderContent() {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        super.renderContent(),
      ],
    );
  }

}