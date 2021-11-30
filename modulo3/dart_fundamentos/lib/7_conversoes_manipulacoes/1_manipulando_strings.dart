void main(List<String> args) {
  final nome = 'Rodrigo Rahman';

  var substringNome = nome.substring(7);
  print(substringNome);

  var substringNome2 = nome.substring(0, 7);
  print(substringNome2);

  var sexo = 'Masculino';
  var sexoSigla = sexo.substring(0, 1);
  print(sexoSigla);

  if (sexoSigla == 'M') {
    print('Olá, seu sexo é Masculino');
  }
  if (sexo.toLowerCase().startsWith('m')) {
    print('Olá, seu sexo é Masculino');
  }
  if (sexo[0] == 'M') {
    print('Olá, seu sexo é Masculino');
  }

  if (nome.toLowerCase().contains('RAHMAN')) {
    print('É da família Rahman');
  }

  /// Interpolação
  var primeiroNome = 'Rodrigo';
  var segundoNome = 'Rahman';

  var saudacao = 'Olá ' + primeiroNome + ' ' + segundoNome;
  print(saudacao);
  var saudacao2 = 'Olá $primeiroNome $segundoNome';
  print(saudacao2);

  print('Olá ${primeiroNome.toLowerCase()}');

  print('Soma de 2 + 2 é ${2 + 2}');

  var paciente = 'Rodrigo Rahman|30|Especialista Dart e Flutter|SP';
  var dadosPaciente = paciente.split('|');
  /// [Rodrigo Rahman, 30, Especialista Dart e Flutter, SP]
  print(dadosPaciente);
  print(dadosPaciente[0]);
  print(dadosPaciente[1]);
  print(dadosPaciente[2]);
  print(dadosPaciente[3]);
  print('-----');

  for (var dado in dadosPaciente) {
    print(dado);
  }

  print('-----');
  dadosPaciente.forEach(print);
  print('-----');

  var pacientes = [
    'Rodrigo Rahman|30|Especialista Dart e Flutter|SP',
    'Luana Rahman|30|Especialista Dart e Flutter|SP',
    'Guilherme Rahman|30|Especialista Dart e Flutter|SP',
  ];

  final dados = pacientes.map((e) => e.split('|')).toList();
  print(dados);
  print('-----');

  final ultimoNomePacientes = pacientes.
    map((e) => e.split('|')[0].toString().split(' ').last).toList();
  /// [Rahman, Rahman, Rahman]
  print(ultimoNomePacientes);
  print('-----');
}