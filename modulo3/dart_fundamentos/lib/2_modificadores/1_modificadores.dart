///Dá erro:
// final test;
// test = 'a';
final test2 = 'a';

void main() {
  final nome;
  /// dá erro falando que não foi inicializada, é como
  /// a questão da variável local ou superior, localmente
  /// pode inicializar variáveis final depois.
  // print(nome.hashCode);
  nome = 'nome';
  print(nome.hashCode);

  final nomeCompletoFinal = 'Rodrigo Rahman';
  final nomeCompletoFinal2 = nome;

  ///Dá erro:
  // const nomeCompletoConst;
  // nomeCompletoConst = 'Rodrigo Rahman';

  const nomeCompletoConst = 'Rodrigo Rahman';
  ///Dá erro, pois a variável nome é criada em tempo
  ///de execução, então a variável [nome] ainda não
  ///está preparada, portanto uma variável const que
  ///precisa do dado em tempo de compilação não irá
  ///funcionar recebendo uma variável que ainda não
  ///está pronta.
  // const nomeCompletoConst2 = nome;
  const nomeCompletoConst2 = nomeCompletoConst;
}