import 'package:bloc_provider_introducao/home/bloc/counter_bloc.dart';
import 'package:bloc_provider_introducao/home/cubit/counter_cubit.dart';
import 'package:bloc_provider_introducao/home/home_page.dart';
import 'package:bloc_provider_introducao/home/home_page_cubit.dart';
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
      home: Scaffold(
        appBar: AppBar(),
        // body: BlocProvider<CounterBloc>(
        //   create: (context) => CounterBloc(),
        //   child: const HomePage(),
        // )
        body: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
          child: const HomePageCubit(),
        )
      ),
    );
  }
}