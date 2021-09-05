import 'package:bloc_provider_introducao/home/bloc/home_state.dart';
import 'package:bloc_provider_introducao/home_cubit/home_cubit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubitPage extends StatelessWidget {
  const HomeCubitPage({ 
    Key? key,
  }) : super(key: key);

  void _proccessClickStrategy({
    required BuildContext context,
    bool? isIncrement,
  }) {
    print('PROCCESS CLICK');
    final bloc = context.read<HomeCubitBloc>();
    if (isIncrement ?? true) {
      bloc.add();
    }
    else {
      bloc.subtract();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD SCREEN');
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<HomeCubitBloc, HomeState>(
            builder: (_, state) => Text('Contador: ${state.value}'),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _proccessClickStrategy(context: context,), 
                child: const Text('Incrementar'),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: () => _proccessClickStrategy(context: context, isIncrement: false,), 
                child: const Text('Decrementar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}