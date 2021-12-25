import 'package:flutter/material.dart';

class MediaQueryPage extends StatelessWidget {

  const MediaQueryPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    debugPrint('width: ${mediaQuery.size.width}');
    debugPrint('height: ${mediaQuery.size.height}');
    debugPrint('orientation: ${mediaQuery.orientation}');
    debugPrint('StatusBar height: ${mediaQuery.padding.top}');
    debugPrint('AppBar height: $kToolbarHeight');

    var appBar = AppBar(
      title: const Text('MediaQuery Page'),
    );

    debugPrint('AppBar height: ${appBar.preferredSize.height}');

    final statusBarHeight = mediaQuery.padding.top;
    final appBarHeight = appBar.preferredSize.height;
    final heightBody = mediaQuery.size.height 
      - statusBarHeight - appBarHeight;

    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            width: mediaQuery.size.width * .5,
            height: heightBody * .5,
          ),
          Container(
            color: Colors.blue,
            width: mediaQuery.size.width,
            height: heightBody * .5,
          ),
        ],
      ),
    );
  }
}