import 'package:flutter/material.dart';
import 'package:singleton_pattern/random_singletons/singleton_access_instance.dart';
import 'package:singleton_pattern/random_singletons/singleton_static_access.dart';
import 'package:singleton_pattern/singleton_sqflite/singleton_sqflite.dart';

void main() {
  for (var x = 0; x < 10; x++) {
    final _instance = SingletonAccessInstance();
    print(_instance.id);
  }

  print('\n\n\tAQUI');
  
  for (var x = 0; x < 10; x++) {
    final _instance = SingletonStaticAccess.instance;
    print(_instance.id);
  }

  print('\n\n\tAQUI');

  runApp(
    MaterialApp(
      title: 'Singleton',
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var items = <String>[];

  @override 
  void initState() {
    super.initState();

    _getItems();
  }

  Future<void> _getItems() async {
    final itemsToAdd = await SingletonSqflite.instance.getNames();
    setState(() {
      items = itemsToAdd;
    });
  }

  @override 
  Widget build(covariant Element element) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Singleton'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await SingletonSqflite.instance.addName();
          _getItems();
        },
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(items[index]),
        ),
      ),
    );
  }
}