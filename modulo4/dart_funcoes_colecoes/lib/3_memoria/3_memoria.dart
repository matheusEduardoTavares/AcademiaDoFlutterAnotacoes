// ignore_for_file: file_names
void main(List<String> args) {
  final lista = ['Rodrigo'];
  print('lista.hashCode = ${lista.hashCode}');
  print(lista);

  funcao(lista);
  print(lista);
  print('lista.hashCode = ${lista.hashCode}');

  var nome = 'Rodrigo Rahman';
  print('nome = $nome');
  print('{nome.hashCode} = ${nome.hashCode}');
  funcao2(nome);
  print('nome = $nome');

  var list = ['Rodrigo'];
  print(list);
  addLista(list);
  print(list);
}

void funcao2(String nome) {
  print('{nome.hashCode} = ${nome.hashCode}');
  nome += ' Academia do flutter';
  print('nome na função = $nome');
  print('{nome.hashCode} = ${nome.hashCode}');
}

void funcao(List<String> nomes) {
  nomes.add('Rahman');
  print('nomes.hashCode = ${nomes.hashCode}');
}

/// Ideal:
List<String> addLista(List<String> nomes) {
  final novoNomes = [ ...nomes ];
  novoNomes.add('Rodrigo Rahman');
  print('novoNomes = $novoNomes');
  return novoNomes;
}