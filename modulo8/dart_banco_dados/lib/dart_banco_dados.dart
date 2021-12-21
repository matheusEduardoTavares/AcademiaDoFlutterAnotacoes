import 'dart:io';

import 'package:dart_banco_dados/database.dart';
import 'package:mysql1/mysql1.dart';

Future<void> main(List<String> args) async {
  final database = Database();
  var mysqlConnection = await database.openConnection();

  ///Inserindo um dado
  // var resultado = await mysqlConnection.query(
  //   'insert into aluno(id, nome) values(?, ?)',
  //   [
  //     null, 
  //     'Rodrigo Rahman 2',
  //   ],
  // );

  // print(resultado.affectedRows);

  final resultadoSelect = await mysqlConnection.query('select * from aluno');
  // ignore: avoid_function_literals_in_foreach_calls
  resultadoSelect.forEach((row) {
    ///Cada índice é a posição da coluna no select
    print('Resultado por Índice');
    print('0: ${row[0]}');
    print('1: ${row[1]}');

    ///Aqui pega-se o resultado direto da coluna
    print('Resultado pelo nome da coluna');
    print('id: ${row['id']}');
    print('nome: ${row['nome']}');
  });

  await mysqlConnection.query('update aluno set nome = ? where id = ?', ['Academia do flutter', 1]);

  var resultadoSelectUnico = await mysqlConnection.query('select * from aluno where id = ?', [
    1
  ]);
  print('parâmetro único');

  if (resultadoSelectUnico.isNotEmpty) {
    var rowUnico = resultadoSelectUnico.first;

    print('id: ${rowUnico['id']}');
    print('nome: ${rowUnico['nome']}');
  }

  try {
    await mysqlConnection.query('update aluno set nome = ? where id = ?', [1, 'Academia do flutter']);
  }
  on MySqlException catch(e) {
    print(e);
    print('Erro ao atualizar dados do aluno');
  }

  // await mysqlConnection.query('delete from aluno where id = ?', [1]);

  ///Commit é efetivar uma transação.
  await mysqlConnection.transaction((conn) {

  });

  exit(0);
}