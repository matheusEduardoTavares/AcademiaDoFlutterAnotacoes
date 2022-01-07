import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_controller.dart';

class ContadorCodeGenPage extends StatefulWidget {
  const ContadorCodeGenPage({Key? key}) : super(key: key);

  @override
  State<ContadorCodeGenPage> createState() => _ContadorCodeGenPageState();
}

class _ContadorCodeGenPageState extends State<ContadorCodeGenPage> {
  final _controller = ContadorCodeGenController();
  final _reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    ///O autorun é uma das reactions do mobx.
    ///Ele roda a primeira vez que a função é 
    ///criada e também sempre quando algum dos 
    ///observáveis que está sendo usado dentro dele
    ///for alterado também.
    ///Todas reactions retornam um ReactionDisposer,
    ///e este objeto retornado é uma função que deve
    ///ser chamada para dar dispose na reaction para
    ///que não fique na memória atoa.
    ///Resumindo, o autorun fica escutando as 
    ///variáveis que estão sendo usadas dentro
    ///dele e também roda logo quando criado
    final autorunDisposer = autorun((_) {
      debugPrint('------------------ autorun ------------------------');
      debugPrint(_controller.fullName.first);
      debugPrint(_controller.fullName.last);
    });

    ///Outra reação é a reaction, em que passamos 
    ///como segundo parâmetro a função que queremos
    ///executar e como primeiro parâmero qual é a variável
    ///que a reação deve ficar escutando para que 
    ///dispare a callback do segundo parâmetro quando
    ///tal observable mudar. 
    ///Ele não é executado ao ser criado, só quando
    ///o observable do parâmetro 1 muda.
    ///Resumindo no reaction nós falamos para o 
    ///mobx qual o atributo observável que queremos
    ///observar. E é um único atributo na reaction.
    final reactionDisposer = reaction(
      (_) => _controller.counter, 
      (counter) {
        debugPrint('------------------ reaction ------------------------');
        debugPrint(counter.toString());
      }
    );

    ///Outra reaction é o when. O primeiro 
    ///parâmetro é uma função que mostra quando 
    ///a callback do segundo parâmetro deve ser
    ///disparado. Porém, ele roda uma única vez,
    ///uma vez executado não importa quantas vezes
    ///a condição volte a ficar true, só irá executar
    ///a callback do segundo parâmetro uma vez
    final whenDisposer = when(
      (_) => _controller.fullName.first == 'Rodrigo',
      () {
        debugPrint('------------------ when ------------------------');
        debugPrint(_controller.fullName.first);
      }
    );

    _reactionDisposer.addAll([
      autorunDisposer,
      reactionDisposer,
      whenDisposer
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador mobx codegen'),
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
            TextButton(
              onPressed: () => _controller.changeName(),
              child: Text('Change Name'),
            ),
            TextButton(
              onPressed: () => _controller.rollbackName(),
              child: Text('Rollback Name'),
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

  @override
  void dispose() {
    for (final disposer in _reactionDisposer) {
      disposer();
    }

    super.dispose();
  }
}
