void main(List<String> args) {
  var numero = 0;
  print('While Convencional');
  while(numero <= 10) {
    print(numero);
    numero++;
  }

  var indice = 0;
  print('Do While Convencional');
  do {
    print(indice);
    indice++;
    if (indice == 10) {
      break;
    }
  } while (indice > 0);
}