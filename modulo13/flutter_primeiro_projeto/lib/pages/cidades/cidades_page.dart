import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_primeiro_projeto/pages/cidades/cidade.dart';

class CidadesPage extends StatefulWidget {
  const CidadesPage({ Key? key }) : super(key: key);

  @override
  _CidadesPageState createState() => _CidadesPageState();
}

class _CidadesPageState extends State<CidadesPage> {
  var cidades = <Cidade>[];

  @override
  void initState() {
    super.initState();

    _loadCities();
  }

  Future<void> _loadCities() async {
    final cidadesJson = await 
      rootBundle.loadString('assets/cidades.json');

    List cidadesMap = jsonDecode(cidadesJson);

    setState(() {
      cidades = cidadesMap.map<Cidade>((e) => Cidade.fromMap(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cidades'),
      ),
      body: ListView.builder(
        itemCount: cidades.length,
        itemBuilder: (_, index) {
          var cidade = cidades[index];
          return ListTile(
            title: Text(cidade.cidade),
            subtitle: Text(cidade.estado),
          );
        },
      ),
    );
  }
}