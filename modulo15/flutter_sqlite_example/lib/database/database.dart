import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseSqlite {
  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

    debugPrint(databasePath);
    debugPrint(databaseFinalPath);

    return openDatabase(
      databaseFinalPath,
      version: 2,
      ///Executado sempre que abrir uma nova conexão, e
      ///serve para exectar configurações que precisamos
      ///fazer no banco de dados
      onConfigure: (db) async {
        debugPrint('onConfigure sendo chamado');

        ///Esse comando habilita o uso de Foreign Keys para
        ///o SQFlite
        await db.execute('''
          PRAGMA foreign_keys = ON
        ''');
      },
      ///Chamado somente no momento de criação do BD
      ///(primeira vez que carrega o APP)
      onCreate: (Database db, int version) {
        debugPrint('OnCreate chamado');
        final batch = db.batch();

        batch.execute('''
          create table teste(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
        ''');

        batch.execute('''
            create table produto(
              id Integer primary key autoincrement,
              nome varchar(200)
            )
          ''');

        // batch.execute('''
        //     create table categoria(
        //       id Integer primary key autoincrement,
        //       nome varchar(200)
        //     )
        //   ''');

        batch.commit();
      },
      ///Será chamado sempre que houver uma alteração no version incremetal
      onUpgrade: (Database db, int oldVersion, int version) {
        debugPrint('OnUpgrade chamado');

        final batch = db.batch();

        if (oldVersion == 1) {
          batch.execute('''
            create table produto(
              id Integer primary key autoincrement,
              nome varchar(200)
            )
          ''');

          // batch.execute('''
          //   create table categoria(
          //     id Integer primary key autoincrement,
          //     nome varchar(200)
          //   )
          // ''');
        }

        // if (oldVersion == 2) {
        //   batch.execute('''
        //     create table categoria(
        //       id Integer primary key autoincrement,
        //       nome varchar(200)
        //     )
        //   ''');
        // }

        batch.commit();
      },
      ///Será chamado sempre que houver uma versão no version decremental
      onDowngrade: (Database db, int oldVersion, int version) {
        debugPrint('onDOwngrade chamado');

        final batch = db.batch();

        if (oldVersion == 3) {
          batch.execute('''
            drop table categoria
          ''');

          batch.commit();
        }
      },
    );
  }  
}