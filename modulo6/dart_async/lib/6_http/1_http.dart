import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

Future<void> main() async {
  // await buscarCep();
  // await buscarPosts();
  // await buscarCepErro();
  // await salvarPost();
  await atualizarPost();
}

Future<void> salvarPost() async {
  var url = 'https://jsonplaceholder.typicode.com/posts';

  var mapaRequest = {
    'title': 'Post novo',
    'body': 'Descrição do post',
    'userId': 1
  };

  var response = await http.post(
    Uri.parse(url),
    body: convert.json.encode(mapaRequest),
  );

  print(response.statusCode);
  print(response.body);
}

Future<void> atualizarPost() async {
  var url = 'https://jsonplaceholder.typicode.com/posts/1';

  var mapaRequest = {
    'title': 'Post alterado',
    'body': 'Descrição do post',
    'userId': 1
  };

  var response = await http.put(
    Uri.parse(url),
    body: convert.json.encode(mapaRequest),
    headers: {
      'Content-type': 'application/json; charset=UTF-8'
    }
  );

  print(response.statusCode);
  print(response.body);
}

Future<void> buscarPosts() async {
  var url = 'https://jsonplaceholder.typicode.com/posts';

  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var responseData = convert.jsonDecode(response.body);
    
    if (responseData is List) {
      // ignore: avoid_function_literals_in_foreach_calls
      responseData.forEach((data) => print(data['id']));
    }
  }

}

Future<void> buscarCep() async {
  var url = 'https://viacep.com.br/ws/01001000/json/';

  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var responseData = convert.jsonDecode(response.body);
    ///_InternalLinkedHashMap
    print(responseData.runtimeType);

    if (responseData is Map) {
      print(responseData['cep']);
      print(responseData['logradouro']);
      print(responseData['localidade']);
    }
  }
}

Future<void> buscarCepErro() async {
  var url = 'https://viacep.com.br/ws/9999999/json/';

  var response = await http.get(Uri.parse(url));

  if (response.statusCode >= 200 && response.statusCode < 300) {
    var responseData = convert.jsonDecode(response.body);
    ///_InternalLinkedHashMap
    print(responseData.runtimeType);

    if (responseData is Map) {
      print(responseData['cep']);
      print(responseData['logradouro']);
      print(responseData['localidade']);
    }
  }
  else {
    print('Ocorreu um problema mensagem: ${response.reasonPhrase}');
    print(response.statusCode);
    print(response.body);
    print(response.reasonPhrase);
    print('Tem um erro aí precisa ver');
  }
}