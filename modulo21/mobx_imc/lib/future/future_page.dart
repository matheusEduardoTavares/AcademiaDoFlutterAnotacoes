import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/future/future_controller.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  final _controller = FutureController();
  // Future<String> buscarNome() async {
  //   await Future.delayed(Duration(seconds: 2));

  //   return 'Rodrigo Rahman';
  // }

  @override
  void initState() {
    super.initState();

    _controller.buscarNome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FuturePage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // buscarNome();
          _controller.buscarNome();
        },
        child: Icon(Icons.add),
      ),
      body: Observer(
        builder: (_) {
          return FutureBuilder<String>(
            // future: buscarNome(),
            future: _controller.nomeFuture,
            builder: (_, snapshot) {
              switch (snapshot.connectionState) {

                ///Ainda não foi chamado
                case ConnectionState.none:
                  return SizedBox.shrink();

                ///Execução em andamento
                case ConnectionState.waiting:

                ///Mesma coisa do waiting
                case ConnectionState.active:
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                ///Quando termina
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return Center(
                      ///Da na mesma de usar o .data!
                      // child: Text(snapshot.requireData),
                      child: Text(snapshot.data!),
                    );
                  }

                  return Center(
                    child: Text('Nome não encontrado!!!'),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
