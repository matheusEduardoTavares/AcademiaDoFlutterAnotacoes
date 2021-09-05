import 'package:bloc_provider_introducao/home_cubit/home_cubit_bloc.dart';
import 'package:bloc_provider_introducao/home_cubit/home_cubit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
  MaterialApp(
    title: 'BlocProviderIntroducao',
    // home: BlocProvider(
    //   create: (_) => HomeBloc(),
    //   child: HomePage(),
    // ),
    home: BlocProvider(
      create: (_) => HomeCubitBloc(),
      child: HomeCubitPage(),
    ),
  ),
);