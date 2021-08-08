///Variáveis de nível superior e atributos de
///classe non-nullable obigatoriamente devem ser 
///inicializadas. Variáveis locais non-nullable não
///precisam ser inicializadas ao instanciá-las. Há
///a promoção de variáveis nullable para non-nullable
///em escopos locais, mas não acontece isso com variáveis
///de escopo superior ou atributos de classe.
///Variáveis de nível superior não podem ser inicializadas
///depois

///Dá erro
// String nomeCompletoSuperior;
///Funciona:
// String? nomeCompletoSuperior;
String nomeCompletoSuperior = 'Rodrigo';
String? nomeCompletoOpc;

void main() {
  ///Erro devido ao nullsafety
  // String nomeCompleto = null;

  ///O null também é uma instância da classe Null
  String? nomeCompleto;
  if (nomeCompleto != null) {
    print(nomeCompleto.length);
  }
  try {
    print(nomeCompleto!.length);
  }
  catch(err) {
    print('err = $err');
  }

  ///Variáveis locais não precisam ser inicializadas
  ///sem valor, e depois receber uma atribuição.

  String? nomeCompleto2;
  nomeCompleto2 = 'Rodrigo';
  print(nomeCompleto2.length);

  ///Variáveis locais que são nulas(nullable) por padrão
  ///, se for atribuído um valor a ela, automaticamente
  ///elas são promovidas a nao nulo (non-null)
  nomeCompletoOpc = '';
  ///Dá erro
  ///Variáveis de nível superior NUNCA são promovidas
  ///para não nulo (non-null)
  ///a não nulo
  // print(nomeCompletoOpc.length);
}