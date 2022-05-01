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
      body: Column(
        children: [
          BlocSelector<ExampleBloc, ExampleState, bool>(
            selector: (state) {
              if (state is ExampleStateInitial) {
                return true;
              }

              return false;
            }, 
            builder: (_, showLoader) {
              if (showLoader) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return const SizedBox.shrink();
            }
          ),
          BlocConsumer<ExampleBloc, ExampleState>(
            builder: (_, state) {
              if (state is ExampleStateData) {
                return Text('Total de nomes é ${state.names.length}');
              }

              return const SizedBox.shrink();
            }, 
            listener: (_, state) {
              debugPrint('Estado alterado para ${state.runtimeType}');
            },
          ),
          BlocListener<ExampleBloc, ExampleState>(
            listener: (_, state) {
              if (state is ExampleStateData) {
                ScaffoldMessenger.of(context)
                  .showSnackBar(
                    SnackBar(
                      content: Text('A quantidade de nomes é ${state.names.length}')
                    )
                  );
              }
            },
            child: BlocSelector<ExampleBloc, ExampleState, List<String>>(
              builder: (_, items) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(items[index]),
                  )
                );
              },
              selector: (state) {
                if (state is ExampleStateData) {
                  return state.names;
                }

                return [];
              },
            ),
            // child: BlocBuilder<ExampleBloc, ExampleState>(
            //   builder: (_, state) {
            //     if (state is ExampleStateData) {
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: state.names.length,
            //         itemBuilder: (_, index) => ListTile(
            //           title: Text(state.names[index]),
            //         )
            //       );
            //     }

            //     return const SizedBox.shrink();
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}