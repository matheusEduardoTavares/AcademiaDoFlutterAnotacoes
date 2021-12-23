import 'package:flutter/material.dart';
import 'package:flutter_fundamentos/home_page_stateless.dart';

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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      debugPrint('addPostFrameCallback');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HomePageStateless(),
        ),
      );
    });

    debugPrint('Fim do initState');
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}