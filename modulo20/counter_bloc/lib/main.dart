import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/home_page.dart';
import 'package:counter_bloc/page_bloc/counter_bloc_page.dart';
import 'package:counter_bloc/page_cubit/counter_cubit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/bloc': (_) => BlocProvider(
          create: (_) => CounterBloc(),
          child: const CounterBlocPage(),
        ),
        '/cubit': (_) => const CounterCubitPage()
      },
      home: const HomePage(),
    );
  }
}