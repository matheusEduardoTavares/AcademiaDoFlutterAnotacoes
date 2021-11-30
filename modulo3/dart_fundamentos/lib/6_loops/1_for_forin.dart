void main(List<String> args) {
  var numeros = List.generate(10, (index) => index);
  var nomes = ['Rodrigo', 'Guilherme', 'Arthur', 'Sandra', 'Marcos'];

  print('Imprimindo números com for convencional');
  for(var i = 0; i < numeros.length; i++) {
    print(numeros[i]);
  }

  print('Imprimindo nomes com for convencional');
  for(var i = 0; i < nomes.length; i++) {
    print(nomes[i]);
  }

  print('Imprimindo números com for-in');
  for(var numero in numeros) {
    print('numero = $numero');
  }

  print('Imprimindo nomes com for-in');
  for(var nome in nomes) {
    print('nome = $nome');
  }

  print('Imprimindo nomes com for convencional e break');
  for(var i = 0; i < nomes.length; i++) {
    print(nomes[i]);
    if (i == 1) {
      break;
    }
  }

  print('Imprimindo nomes com for-in e break');
  for(var nome in nomes) {
    print('nome = $nome');
    if (nome == 'Guilherme') {
      break;
    }
  }

  print('Imprimindo nomes com for convencional com continue');
  for(var i = 0; i < nomes.length; i++) {
    if (i == 1 || i == 3) {
      continue;
    }
    print(nomes[i]);
  }
}