import 'package:flutter/material.dart';
import 'package:mobx_imc/contador/contador_page.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_page.dart';
import 'package:mobx_imc/imc/imc_page.dart';
import 'package:mobx_imc/observable_model/observable_model_page.dart';
import 'package:mobx_imc/observables/observable_list_page.dart';

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
      // home: ContadorPage(),
      // home: ContadorCodeGenPage(),
      // home: ImcPage(),
      // home: ObservableListPage(),
      home: ObservableModelPage(),
    );
  }
}