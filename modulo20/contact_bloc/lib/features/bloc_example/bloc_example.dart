import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocExample'),
      ),
      body: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (_, state) {
          if (state is ExampleStateData) {
            return ListView.builder(
              itemCount: state.names.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(state.names[index]),
              )
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}