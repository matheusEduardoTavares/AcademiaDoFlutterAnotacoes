import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration.dart';

class MigrationV4 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      alter table todo add column firebaseUserUID varchar(400)
    ''');
  }

  @override
  void update(Batch batch) {
    // batch.execute('''
    //   create table user(
    //     id Integer primary key autoincrement,
    //     firebaseUserUID varchar(400)
    //   )
    // ''');

    batch.execute('''
      alter table todo add column firebaseUserUID varchar(400)
    ''');

    // batch.execute('''
    //   ALTER TABLE todo ADD CONSTRAINT firebaseUserUID
    //               FOREIGN KEY (firebaseUserUID) 
    //               REFERENCES user(firebaseUserUID)
    // ''');
  }

}