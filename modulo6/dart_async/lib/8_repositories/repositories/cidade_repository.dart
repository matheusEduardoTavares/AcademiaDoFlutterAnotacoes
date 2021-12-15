import 'package:http/http.dart' as http;
import '../models/cidade.dart';

class CidadeRepository {
  Future<Cidade> buscarCidade() async {
    var url = 'https://viacep.com.br/ws/01001000/json/';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Cidade.fromJson(response.body);
    } 

    throw Exception();
  }  
}