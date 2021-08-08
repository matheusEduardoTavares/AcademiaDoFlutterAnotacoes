void main(List<String> args) {
  final idade = 12;

  if (idade >= 18) {
    print('maior de idade');
  }
  else {
    print('menor de idade');
  }

  final eMaiorDeIdade = idade >= 18 ? true : false;

  print('É maior de idade ? ' + eMaiorDeIdade.toString());

  ///Não é uma boa prática, nesse exemplo gera uma 
  ///complexidade muito grande e desnecessária
  print((idade < 13) ? 'Criança' : (idade > 12 && idade < 18) ? 'Adolescente' : 'Adulto');

  final ano = 2024;
  
  print((ano % 4 == 0 || ano % 400 == 0 || ano % 100 != 0) ? 'Bissexto' : 'Não é Bissexto');
}