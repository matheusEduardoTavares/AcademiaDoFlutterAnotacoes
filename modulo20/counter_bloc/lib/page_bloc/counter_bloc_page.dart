import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stream = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (_, state) => Text(
                'Counter ${state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    stream.add(CounterIncrement());
                  }, 
                  icon: const Icon(Icons.add),
                  label: const Text(''),
                ),
                TextButton.icon(
                  onPressed: () {
                    stream.add(CounterDecrement());
                  }, 
                  icon: const Icon(Icons.remove),
                  label: const Text(''),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}