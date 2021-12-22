import 'package:flutter/material.dart';

class HomePageStateful extends StatefulWidget {
  const HomePageStateful({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageStateful();

}

class _HomePageStateful extends State<HomePageStateful> {
  var texto = 'Estou no StatefulWidget';

  @override
  void initState() {
    super.initState();

    texto = 'Texto alterado pelo initState';
  }

  @override 
  Widget build(BuildContext context) {
    debugPrint('Buildando o HomePageStatefull');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(texto),
          TextButton(
            onPressed: () {
              setState(() {
                texto = 'Alterei o texto do StatefulWidget';
              });
            },
            child: const Text('Alterei o texto do StatefulWidget'),
          ),
        ],
      ),
    );
  }
}