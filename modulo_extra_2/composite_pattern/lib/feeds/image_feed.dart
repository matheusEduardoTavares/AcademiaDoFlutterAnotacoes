import 'package:composite_pattern/feeds/feed.dart';
import 'package:flutter/material.dart';

class ImageFeed extends Feed {
  final String text;
  final String url;

  ImageFeed({
    required this.text,
    required this.url,
  }) : super(text: text);

  @override 
  Widget renderContent() {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                url,
              ),
            )
          ),
        ),
        super.renderContent(),
      ],
    );
  }
}