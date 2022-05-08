import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFreezedExample extends StatelessWidget {

  const BlocFreezedExample({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Example Freezed'),),
           floatingActionButton: FloatingActionButton(
             onPressed: () {
               context.read<ExampleFreezedBloc>().add(
                 ExampleFreezedEvent.addName('Novo nome freezed')
                );
             },
           ),
           body: BlocListener<ExampleFreezedBloc, ExampleFreezedState>(
             listener: (_, state) {
               state.whenOrNull(
                 showBanner: (_, message) {
                   ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message))
                    );
                 } 
                );
             },
             child: Column(
               children: [
                 BlocSelector<ExampleFreezedBloc, ExampleFreezedState, bool>(
                  selector: (state) {
                    return state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
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
                 BlocSelector<ExampleFreezedBloc, ExampleFreezedState, List<String>>(
                   selector: (state) {
                    ///Existe também as estruturas orNull no freezed,
                    ///em que tratamos os casos que queremos retornando
                    ///para cada tipo de construtor o que queremos, e os
                    ///construtores que não nos importar tratar, não 
                    ///definimos ele na estrutura e assim será retornado null
                    ///quando cair um caso dele
                    //  state.mapOrNull()
                    //  state.whenOrNull()
                     return state.maybeWhen(
                       data: (names) => names,
                       showBanner: (names, _) => names,
                       orElse: () => <String>[]
                      );
                   }, 
                   builder: (_, names) {
                     debugPrint('Build Names!!!!!!!!!!!!1');
                     return ListView.builder(
                      shrinkWrap: true,
                      itemCount: names.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(names[index]),
                        onTap: () {
                          context.read<ExampleFreezedBloc>().add(ExampleFreezedEvent.addName(
                            names[index]
                          ));
                        },
                      )
                    );
                   }
                )
               ],
             ),
           ),
       );
  }
}