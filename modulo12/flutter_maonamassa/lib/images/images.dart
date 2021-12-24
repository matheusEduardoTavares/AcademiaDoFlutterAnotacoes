import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('MediaQuery.of(context).devicePixelRatio = ${MediaQuery.of(context).devicePixelRatio}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: Center(
        // child: Image(
        //   image: AssetImage('assets/paisagem.jpg')
        // ),
        child: Column(
          children: [
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/paisagem.jpg',
                // fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
              // child: const Image(
              //   image: NetworkImage(
              //     'https://miro.medium.com/max/1200/1*nT-QbKDbz06OoS3xzpvcAQ.jpeg',
              //   ),
              // ),
              child: Image.network(
                'https://miro.medium.com/max/1200/1*nT-QbKDbz06OoS3xzpvcAQ.jpeg',
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              width: 300,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/paisagem.jpg'
                  ),
                  fit: BoxFit.cover
                ),
              ),
              child: Center(
                child: Text(
                  'Paisagem',
                  style: TextStyle(
                    backgroundColor: Colors.white.withOpacity(0.6),
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}