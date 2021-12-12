///Dentro do dart, uma classe pode virar 
///uma anotação (chamado de metadata). Para
///poder utilizar uma classe como anotação,
///seu construtor deve ser const. Isso serve
///para quando queremos gerar códigos via build_runner
///deixar uma classe anotada para que ele possa
///ler e interpretar o que deve ser gerado
class Fazer {
  const Fazer({
    required this.quem,
    required this.oque,
  });

  final String quem;
  final String oque;
}
