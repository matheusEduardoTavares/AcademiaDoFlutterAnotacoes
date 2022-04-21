import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: SizedBox(
        // height: 400,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              color: Colors.green,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.amber,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 300,
                width: 300,
                color: Colors.blue,
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Container(
            //     height: 150,
            //     width: 150,
            //     color: Colors.pink,
            //   ),
            // ),
            Positioned(
              // top: 40,
              right: 100,
              bottom: 10,
              child: Container(
                height: 150,
                width: 150,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}