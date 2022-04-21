import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
    required FirebaseAuth firebaseAuth,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory, 
    _firebaseAuth = firebaseAuth;

  final SqliteConnectionFactory _sqliteConnectionFactory;
  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> save(DateTime date, String description) async {
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      final conn = await _sqliteConnectionFactory.openConnection();
      await conn.insert('todo', {
        'id': null,
        'descricao': description,
        'data_hora': date.toIso8601String(),
        'finalizado': 0,
        'firebaseUserUID': user.uid,
      });
    }
    else {
      throw Exception('User needs be logged');
    }
  }

  @override
  Future<List<TaskModel>> findByPeriod(DateTime start, DateTime end) async {
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      final startFilter = DateTime(start.year, start.month, start.day, 0, 0, 0);
      final endFilter = DateTime(end.year, end.month, end.day, 23, 59, 59);

      final conn = await _sqliteConnectionFactory.openConnection();
      final result = await conn.rawQuery('''
        select * from todo 
        where data_hora between ? and ? 
        and firebaseUserUID = ?
        order by data_hora
      ''', [startFilter.toIso8601String(), endFilter.toIso8601String(), user.uid]);

      return result.map(TaskModel.fromMap).toList();
    }
    else {
      throw Exception('User needs be logged');
    }
  }

  @override
  Future<void> checkOrUncheckTask(TaskModel task) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final finished = task.finished ? 1 : 0;

    await conn.rawUpdate('''
      update todo set finalizado = ? where id = ?
    ''', [finished, task.id]);
  }

  @override
  Future<void> deleteTask(TaskModel task) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    await conn.delete('todo', where: 'id = ?', whereArgs: [task.id]);
  }
}