import 'package:factory_method/factories/dialog_action.dart';
import 'package:factory_method/factories/dialog_factory.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _openDialog() {
    DialogFactory.showAlertDialog(
      context,
      title: const Text('Título X'),
      content: const Text('Conteúdo X'),
      actions: [
        DialogAction(
          child: const Text('Sim'), 
          onPressed: () => print('Sim'),
        ),
        DialogAction(
          child: const Text('Não'), 
          onPressed: () => print('Não'),
        ),
      ],
    );
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
            Text(
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
        onPressed: _openDialog,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
