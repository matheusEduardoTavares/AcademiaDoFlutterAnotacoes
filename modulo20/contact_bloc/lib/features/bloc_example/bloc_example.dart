import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExample extends StatefulWidget {
  const BlocExample({ Key? key }) : super(key: key);

  @override
  State<BlocExample> createState() => _BlocExampleState();
}

class _BlocExampleState extends State<BlocExample> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocExample'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
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
            buildWhen: (previous, current) {
              if (previous is ExampleStateInitial && current is ExampleStateData) {
                if (current.names.length > 4) {
                  return true;
                }
              }

              return false;
            },
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
            listenWhen: (previous, current) {
              if (previous is ExampleStateInitial && current is ExampleStateData) {
                if (current.names.length > 4) {
                  return true;
                }
              }

              return false;
            },
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
            child: Expanded(
              child: BlocSelector<ExampleBloc, ExampleState, List<String>>(
                builder: (_, items) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (_, index) => ListTile(
                            title: Text(items[index]),
                            onTap: () {
                              context.read<ExampleBloc>().add(ExampleRemoveNameEvent(
                                name: items[index]
                              ));
                            },
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _nameEC,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Digite um nome'
                            ),
                            onFieldSubmitted: (data) {
                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<ExampleBloc>().add(ExampleAddNameEvent(name: data));
                                _nameEC.clear();
                              }
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Digite um nome';
                              }

                              return null;
                            },
                          ),
                        ),
                      )
                    ],
                  );
                },
                selector: (state) {
                  if (state is ExampleStateData) {
                    return state.names;
                  }

                  return [];
                },
              ),
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

  @override
  void dispose() {
    _nameEC.dispose();

    super.dispose();
  }
}