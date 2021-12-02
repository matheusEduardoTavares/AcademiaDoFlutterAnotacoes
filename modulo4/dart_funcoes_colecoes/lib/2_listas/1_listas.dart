// ignore_for_file: file_names
void main(List<String> args) {
  final numeros = List.generate(10, (index) => index);
  numeros.forEach(print);
  numeros.forEach(printAcademia);

  /// Expand funciona como o flat map e serve também
  /// para duplicar listas
  /// Array BiDimensional
  var lista = [
    [1, 2], [3, 4]
  ];

  print(lista[0][0]);

  final listaNova = lista.expand((element) => element).toList();
  print(listaNova);

  /// any
  final listaBusca = ['Rodrigo', 'João', 'José'];

  print('.any');
  if (listaBusca.any((element) => element == 'João')) {
    print('Tem João');
  }
  else {
    print('Não tem João');
  }

  /// every
  final listaBusca2 = ['Rodrigo', 'João', 'José'];

  print('.every');
  if (listaBusca2.every((element) => element.contains('J'))) {
    print('Todos os nomes tem a Letra J');
  }
  else {
    print('Nem todos os nomes tem a Letra J');
  }

  /// sort
  final listaParaOrdenacao = [99, 22, 10, 9, 0, 765, 1, 2, 3, 100, 300];
  listaParaOrdenacao.sort();

  print('.sort');
  print(listaParaOrdenacao);

  var listaNomesOrdenacao = ['Rodrigo', 'João', 'André', 'Arthur', 'José'];
  listaNomesOrdenacao.sort();
  print(listaNomesOrdenacao);

  var listaPacientes = [
    'Rodrigo Rahman|37',
    'Luana Rahman|35',
    'Guilherme|18',
    'Arthur|5',
    'Antonio|50'
  ];
  listaPacientes.sort((paciente1, paciente2) {
    final pacienteDados1 = paciente1.split('|');
    final pacienteDados2 = paciente2.split('|');

    final idadePaciente1 = int.parse(pacienteDados1[1]);
    final idadePaciente2 = int.parse(pacienteDados2[1]);

    /// Retornando 1 é invertido a posição na lista, dessa forma, 
    /// o paciente mais novo vai sendo passado para o fim
    // if (idadePaciente1 < idadePaciente2) {
    
    /// Retornando 1 é invertido a posição na lista, dessa forma, 
    /// o paciente mais velho vai sendo passado para o fim
    if (idadePaciente1 > idadePaciente2) {
      return 1;
    }
    else if (idadePaciente1 == idadePaciente2) {
      return 0;
    }

    return -1;
  });
  print(listaPacientes);

  print('sort com CompateTo');
  var listaPacientes2 = [
    'Rodrigo Rahman|37',
    'Luana Rahman|35',
    'Guilherme|18',
    'Arthur|5',
    'Antonio|50'
  ];
  listaPacientes2.sort((paciente1, paciente2) {
    final pacienteDados1 = paciente1.split('|');
    final pacienteDados2 = paciente2.split('|');

    final idadePaciente1 = int.parse(pacienteDados1[1]);
    final idadePaciente2 = int.parse(pacienteDados2[1]);

    /// Retornando 1 é invertido a posição na lista, dessa forma, 
    /// o paciente mais novo vai sendo passado para o fim
    // if (idadePaciente1 < idadePaciente2) {
    
    /// Retornando 1 é invertido a posição na lista, dessa forma, 
    /// o paciente mais velho vai sendo passado para o fim
    return idadePaciente1.compareTo(idadePaciente2);
  });
  print(listaPacientes2);

  var listaPacientes3 = [
    'Rodrigo Rahman|37',
    'Luana Rahman|35',
    'Guilherme|18',
    'Arthur|5',
    'Antonio|50'
  ];
  funcaoQualquer(listaPacientes3);
  print(listaPacientes3);
}

void printAcademia(int valor) {
  print(valor);
}

void funcaoQualquer(List<String> pacientes) {
  /// Ideal é sempre criar uma nova lista a partir do parâmetro para
  /// evitar que uma função no escopo de uma função altere uma variável
  /// que está fora de seu escopo

  pacientes.sort((paciente1, paciente2) {
    final pacienteDados1 = paciente1.split('|');
    final pacienteDados2 = paciente2.split('|');

    final idadePaciente1 = int.parse(pacienteDados1[1]);
    final idadePaciente2 = int.parse(pacienteDados2[1]);

    /// Retornando 1 é invertido a posição na lista, dessa forma, 
    /// o paciente mais novo vai sendo passado para o fim
    // if (idadePaciente1 < idadePaciente2) {
    
    /// Retornando 1 é invertido a posição na lista, dessa forma, 
    /// o paciente mais velho vai sendo passado para o fim
    return idadePaciente1.compareTo(idadePaciente2);
  });
  print(pacientes);
}