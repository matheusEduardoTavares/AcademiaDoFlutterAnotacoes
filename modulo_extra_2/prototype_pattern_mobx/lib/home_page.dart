import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototype_pattern_mobx/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _store = HomeStore();

  @override
  void initState() {
    super.initState();

    _store.loadCliente();
  }

  @override
  Widget build(BuildContext context) {
    if (_store.cliente == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _store.fazerAniversario(),
        label: const Text('Fazer aniversário'),
      ),
      body: Center(
        child: Observer(
          builder: (_) => Column(
            children: [
              Text(_store.cliente!.nome!),
              Text(_store.cliente!.idade.toString()),
              Text(_store.cliente!.telefone!),
            ],
          ),
        ),
      ),
    );
  }
}