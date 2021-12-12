void main(List<String> args) {
  print('Iniciou o processo');

  p2();
  int i = 0;
  while (i < 5) {
    print(i);
    i++;
  }

  m2();
  print('Finalizou');
}

void m2() {
  print('Função 2');
}

void p2() {
  Future.delayed(Duration(seconds: 2), () {
    print('Processo 2 sendo executado');
  });
}