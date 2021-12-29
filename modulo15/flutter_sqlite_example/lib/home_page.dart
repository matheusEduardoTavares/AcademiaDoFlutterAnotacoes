import 'package:flutter/material.dart';
import 'package:flutter_sqlite_example/database/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    _database();
  }

  Future<void> _database() async {
    final database = await DatabaseSqlite().openConnection();

    // database.insert('teste', {'nome': 'Rodrigo Rahman'});
    // database.delete('teste', where: 'nome = ?', whereArgs: ['Rodrigo Rahman']);
    // database.update('teste', {'nome': 'Academia do Flutter'}, where: 'nome = ?', whereArgs: [
    //   'Rodrigo Rahman'
    // ]);

    // var result = await database.query('teste');
    // debugPrint(result.toString());
    // database.rawInsert('insert into teste values(null, ?)', [
    //   'Rodrigo Rahman'
    // ]);

    // database.rawUpdate('update teste set nome = ? where id = ?', [
    //   'Rodrigo Academia do Flutter', 4
    // ]);
    
    // database.rawDelete('delete from teste where id = ?', [4]);

    final result = await database.rawQuery('select * from teste');
    debugPrint(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
    );
  }

}