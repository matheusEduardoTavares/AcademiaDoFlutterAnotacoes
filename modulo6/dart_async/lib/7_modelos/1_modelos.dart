import 'package:dart_async/7_modelos/cidade.dart';
import 'package:http/http.dart' as http;

import 'user.dart';

Future<void> main() async {
  // buscarCep();
  buscarUser();
}

Future<void> buscarCep() async {
  var url = 'https://viacep.com.br/ws/01001000/json/';

  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var cidade = Cidade.fromJson(response.body);
    print(cidade);
    print(cidade.toMap());
    print(cidade.toJson());
  }
}

Future<void> buscarUser() async {
  var url = 'https://5f7cba02834b5c0016b058aa.mockapi.io/api/users/1';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var usuarios = User.fromJson(response.body);
    print(usuarios);

    final map = usuarios.toMap();
    map.update('user_types', (value) => null);

    final user = User.fromMap(map);
    print('user = $user');
  }
}