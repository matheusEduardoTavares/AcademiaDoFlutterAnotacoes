void main(List<String> args) {
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  // ignore: unused_local_variable
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome 
  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.

  print('1 - Remova os pacientes duplicados e apresente a nova lista');
  final peoplesWithoutDuplicated = pessoas.toSet().toList();
  print(peoplesWithoutDuplicated);
  _separatePrint();

  print('2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas');
  final peoplesOnModel = _splitAndTransformList(peoplesWithoutDuplicated);

  _filterBySex('Masculino', peoplesOnModel);
  _filterBySex('Feminino', peoplesOnModel);
  _separatePrint();

  print('3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome');
  _filterByAge(18, peoplesOnModel);
  _separatePrint();

  print('4 - Encontre a pessoa mais velha e apresente o nome dela');
  final olderPeople = _getOlderPeople(peoplesOnModel);
  print('A pessoa mais velha é $olderPeople');
  _separatePrint();
}

void _separatePrint() => print('-----------------\n');

class People {
  People({
    required this.name,
    required this.age,
    required this.sex,
  });

  final String name;
  final int age;
  final String sex;

  @override
  String toString() => 'People(name: $name, age: $age, sex: $sex)';
}

List<People> _splitAndTransformList(List<String> peoples) {
  return peoples.map((e) {
    final separatedData = e.split('|');

    return People(
      name: separatedData[0],
      age: int.parse(separatedData[1]),
      sex: separatedData[2]
    );
  }).toList();
}

void _filterBySex(String sex, List<People> peoples) {
  final filtered = peoples.where((element) => element.sex == sex).toList();

  print('Pessoas do sexo $sex: $filtered');
}

void _filterByAge(int age, List<People> peoples) {
  final filtered = peoples.where((element) => element.age > age).toList();

  for (final model in filtered) {
    print(model.name);
  }
}

People _getOlderPeople(List<People> peoples) {
  return peoples.fold<People?>(
    null, 
    (olderPeople, currentPeople) => olderPeople == null || currentPeople.age > olderPeople.age ? 
      currentPeople : olderPeople
  )!;
}