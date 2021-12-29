import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseSqlite {
  Future<void> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

    debugPrint(databasePath);
    debugPrint(databaseFinalPath);

    openDatabase(
      databaseFinalPath,
      version: 1,
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

        batch.commit();
      },
      ///Será chamado sempre que houver uma alteração no version incremetal
      onUpgrade: (Database db, int oldVersion, int version) {
        debugPrint('OnUpgrade chamado');
      },
      ///Será chamado sempre que houver uma versão no version decremental
      onDowngrade: (Database db, int oldVersion, int version) {
        debugPrint('onDOwngrade chamado');
      },
    );
  }  
}