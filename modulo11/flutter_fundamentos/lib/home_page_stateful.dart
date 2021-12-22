import 'package:flutter/material.dart';

class HomePageStateful extends StatefulWidget {
  HomePageStateful({Key? key}) : 
    super(key: key) {
      debugPrint('HomePageStateful constructor');
    }

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    debugPrint('Create State');
    return _HomePageStateful();
  }

}

class _HomePageStateful extends State<HomePageStateful> {
  _HomePageStateful() {
    debugPrint('_HomePageStateful constructor');
  }

  var texto = 'Estou no StatefulWidget';

  @override
  void initState() {
    super.initState();

    texto = 'Texto alterado pelo initState';
    debugPrint('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    debugPrint('didChangeDependencies');
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