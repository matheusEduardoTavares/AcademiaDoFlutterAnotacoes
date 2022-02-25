import 'package:bloc_provider_introducao/home/bloc/counter_state.dart';
import 'package:bloc_provider_introducao/home/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends StatelessWidget {
  const HomePageCubit({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text('Contador: ${state.value}');
          }
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().add();
              }, 
              child: const Text('Adicionar')
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().subtract();
              }, 
              child: const Text('Subtrair')
            ),
          ],
        ),
      ],
    );
  }
}