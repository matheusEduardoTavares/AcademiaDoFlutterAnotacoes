import 'package:flutter/material.dart';

/*
import 'stub.dart'

    ///O compilador, em imports dynamic, não
    ///avalia o arquivo que está sendo importado
    ///nas condicionais abaixo, avalia só o que
    ///está no stub, que é a base
    if (dart.library.io) 'mobile.dart'
    if (dart.library.html) 'web.dart';
*/

///Nesse caso abaixo é a mesma coisa, mas o default
///é o mobile.dart, então, se rodarmos o projeto
///para web ele vai importar o web.dart, e se
///rodarmos o projeto para qualquer outra plataforma
///ele vai importar o mobile.dart que é o default
import 'mobile.dart' if (dart.library.html) 'web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    printar();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
