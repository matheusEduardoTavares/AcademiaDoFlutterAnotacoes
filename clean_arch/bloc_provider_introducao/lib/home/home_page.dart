import 'package:bloc_provider_introducao/home/bloc/counter_bloc.dart';
import 'package:bloc_provider_introducao/home/bloc/counter_event.dart';
import 'package:bloc_provider_introducao/home/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///BlocListener = pode usar um listener para executar alguma lógica,
        ///tipo os workers do getx e reactions do mobx. Não rebuilda a tela.
        ///BlocBuilder = rebuilda a tela e retorna um widget atualizado
        ///BlocConsumer = Tem tanto o BlocListener quanto o BlocBuilder
        BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text('Contador: ${state.value}');
          }
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterAdd());
              }, 
              child: const Text('Adicionar')
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterSubtract());
              }, 
              child: const Text('Subtrair')
            ),
          ],
        ),
      ],
    );
  }
}