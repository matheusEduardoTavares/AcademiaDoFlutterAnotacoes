import 'dart:io';

Future<void> main() async {
  final path = 'lib/9_files/file.txt';

  var file = File(path);

  /// Leitura síncrona
  var fileData = file.readAsStringSync();
  print(fileData);

  print('\n');

  /// Leitura assíncrona
  var fileDataAsync = await file.readAsString();
  print(fileDataAsync);

  print('\n');

  /// Leitura linha Síncrona (cada linha é 
  /// uma posição do array)
  var fileLista = file.readAsLinesSync();
  print(fileLista);

  print('\n');

   /// Leitura linha Assíncrona
  var fileListaAync = await file.readAsLines();
  print(fileListaAync);

  print('\n');

  /// Escrita
  final path2 = 'lib/9_files/file2.txt';
  var file2 = File(path2);

  ///Escrita assíncrona
  ///Se o arquivo não existir, vai criar o 
  ///arquivo e escrever dentro dele a string 
  ///passada. O parâmetro mode mostra o que 
  ///deve ser feito com a escrita, se sobrescreve
  ///o que já tinha de conteudo caso já tivesse
  ///o arquivo criado, se só adiciona a string,
  ///etc
  await file2.writeAsString(
    'Academia do Flutter',
    mode: FileMode.append,
  );

  ///Escrita síncrona
  file2.writeAsStringSync(
    'Academia do Flutter2',
    mode: FileMode.append,
  );

  var listaNomes = [
    'Rodrigo Rahman', 'Luana', 'João'
  ];

  final path3 = 'lib/9_files/file3.txt';
  var file3 = File(path3);

  ///Adicionando textos dentro de uma lista
  var writeFile = file3.openWrite(
    mode: FileMode.append
  );
  listaNomes.forEach((nome) => 
  writeFile.write(
    '$nome \n',
  )
);
}