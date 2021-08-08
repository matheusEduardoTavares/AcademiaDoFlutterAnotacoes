void main(List<String> args) {
  final diaDaSemana = 0;
  final String diaDaSemanaStr;

  ///Paramos fluxos com break, com uma exceção ou 
  ///com um return.
  switch(diaDaSemana) {
    case 0:
      diaDaSemanaStr = 'Domingo';
      print('Dia da semana em número é 0');
      break;
    case 1:
      diaDaSemanaStr = 'Segunda-feira';
      break;
    case 2:
      diaDaSemanaStr = 'Terça-feira';
      break;
    case 3:
      diaDaSemanaStr = 'Quarta-feira';
      break;
    case 4:
      diaDaSemanaStr = 'Quinta-feira';
      break;
    case 5:
      diaDaSemanaStr = 'Sexta-feira';
      break;
    case 6:
      diaDaSemanaStr = 'Sábado';
      break;
    default:
      diaDaSemanaStr = 'Não identificado';
  }
  print('Dia da semana = $diaDaSemanaStr');

  final idade = 20;

  switch(idade) {
    case 18:
    case 19:
      print('Maior de idade');
      break;
    default:
      print('Menor de idade');
  }

}