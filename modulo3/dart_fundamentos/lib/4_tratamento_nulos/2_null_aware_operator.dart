String? nome;

void main() {
  var nomeCompleto = (nome != null) ? nome! + ' Rahman' : 'Rodrigo Rahman';
  print(nomeCompleto);
  String nomeCompleto2;

  if (nome != null) {
    nomeCompleto2 = nome! + ' Rahman';
  }  
  else {
    nomeCompleto2 = 'Rodrigo Rahman';
  }

  print(nomeCompleto2);

  var nomeLocal = nome;
  if (nomeLocal == null) {
    nomeLocal = 'Rodrigo';
  }

  var nomeCompleto3 = nomeLocal + 'Rahman';

  print(nomeCompleto3);

  
}