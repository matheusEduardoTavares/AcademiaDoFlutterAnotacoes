import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:path/path.dart' as packagePath;

class SingletonSqflite {
  ///Dois singletons, um para a classe de conexão
  ///(SingletonSqflite) e outro para o banco em si (_db)
  static SingletonSqflite? _instance;
  static Database? _db;
  
  static const _dbName = 'db';
  static const _dbVersion = 1;
  static var _insertedItems = 0;

  SingletonSqflite._();

  Future<Database> get db async {
    if (_db == null) {
      await _openDatabase();
    }

    return _db!;
  }

  static SingletonSqflite get instance {
    _instance ??= SingletonSqflite._();

    return _instance!;
  }

  Future<void> _openDatabase() async {
    final path = await getDatabasesPath();
    _db ??= await openDatabase(
      packagePath.join(path, _dbName),
      onCreate: (myDb, myVersion) {
        myDb.execute('create table teste (name varchar(100))');
        myDb.rawInsert('insert into teste values ("mat1"), ("mat1"), ("mat1")');
      },
      version: _dbVersion,
    );
  }

  Future<void> addName() async {
    await _db!.rawInsert('insert into teste values ("inserindo na mão ${++_insertedItems}")');
  }

  Future<List<String>> getNames() async {
    final _myDb = await db;
    final List<Map<String, Object?>>? data = await _myDb.rawQuery('select * from teste');
    final dataNames = data?.map<String>((e) => e['name'].toString()).toList() ?? <String>[];

    return dataNames;
  }
}