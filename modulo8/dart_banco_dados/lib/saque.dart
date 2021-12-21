import 'dart:io';

import 'package:dart_banco_dados/database.dart';

Future<void> main() async {
  var database = Database();

  var conn = await database.openConnection();

  await conn.transaction((_) async {
    print('_ = $_');

    var result = await conn.query('select * from conta_corrente');
    var saldo = result.first['saldo'] as double;
    var saque = 100.0;

    var saldoFinal = saldo - saque;

    if (saldoFinal < 0) {
      throw Exception();
    }

    await conn.query('update conta_corrente set saldo = ? where id = ?', [
      saldo - saque,
      1
    ]);

    await conn.query('insert into tira_dinheiro(id, data_saque) values (?, ?)', [
      null,
      DateTime.now().toIso8601String(),
    ]);
  });

  var result = await conn.query('select * from conta_corrente');
  print('Meu saldo é: ${result.first['saldo']}');

  exit(0);
}