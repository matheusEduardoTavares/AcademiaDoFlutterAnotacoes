import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/contador/contador_controller.dart';

class ContadorPage extends StatelessWidget {
  ContadorPage({Key? key}) : super(key: key);

  final _controller = ContadorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador mobx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) => Text(
                _controller.counter.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Observer(
              builder: (_) => Text(
                _controller.fullName.first.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Observer(
              builder: (_) {
                return Text(
                  _controller.fullName.last.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Observer(
              builder: (_) {
                return Text(
                  _controller.saudacao,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
