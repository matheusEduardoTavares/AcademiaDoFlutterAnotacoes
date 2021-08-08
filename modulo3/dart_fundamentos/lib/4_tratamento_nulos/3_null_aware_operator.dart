String? nome;

void main() {
  final sobrenome = ' Rahman';
  ///Aware operator, é a possibilidade de checarmos
  ///o null sem ter que fazer ifs ou ternários
  var nomeCompleto = (nome ?? 'Rodrigo') + sobrenome;
  print(nomeCompleto);

  String? nomeCompleto2;
  print(nomeCompleto2 ?? 'Rodrigo Rahman');
}