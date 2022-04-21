import 'package:flutter/material.dart';

class CircleAvatarPage extends StatelessWidget {
  const CircleAvatarPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Circle Avatar'),),
      body: Row(
        children: [
          // Container(
          //   width: 100,
          //   height: 100,
          //   child: CircleAvatar(
          //     backgroundImage: NetworkImage('https://docs.flutter.dev/assets/images/dash/early-dash-sketches5.jpg'),
          //   ),
          // ),
          ImageAvatar(urlImage: 'https://docs.flutter.dev/assets/images/dash/early-dash-sketches5.jpg'),
          ImageAvatar(urlImage: 'https://miro.medium.com/max/1838/1*oXbK6TZiqMeXsGW5cRvQoQ.png'),
        ],
      ),
    );
  }
}

class ImageAvatar extends StatelessWidget {
  const ImageAvatar({ 
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.black
              ],
              begin: Alignment.topCenter,
            ),
            color: Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
        Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(urlImage),
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text('AO VIVO', style: TextStyle(fontSize: 8),),
            ),
          ),
        ),
      ],
    );
  }
}