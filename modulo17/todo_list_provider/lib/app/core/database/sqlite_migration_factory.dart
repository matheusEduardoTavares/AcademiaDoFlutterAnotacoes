import 'package:todo_list_provider/app/core/database/migrations/migration.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v1.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v2.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v3.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
    MigrationV1(),
    MigrationV2(),
    MigrationV3(),
  ];

  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];

    ///Considerando que a 
    ///Versão atual = 3, e a versão não foi 
    ///executado ainda o 2 e o 3, então 
    ///precisa executar
    if (version == 1) {
      migrations.add(MigrationV2());
      migrations.add(MigrationV3());
    }
    ///Agora se a versão atual for a 3 e a do 
    ///usuário a 2, faltou executar só a migration
    ///3
    else if (version == 2) {
      migrations.add(MigrationV3());
    }

    return migrations;
  }
}