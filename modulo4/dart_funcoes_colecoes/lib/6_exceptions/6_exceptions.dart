// ignore_for_file: file_names
void main() {
  // var idade = '38 anos';
  var idade = '38';
  String? nome;

  try {
    var idadeParse = int.parse(idade);
    nome!.toLowerCase();

    if (idadeParse == 38) {
      throw Exception();
    }
  } 
  // on Exception {
  //   print('Erro idade == 38');
  // }
  on FormatException catch (e, s) {
    print('Erro ao converter idade');
    print('e = $e');
    print('stackTrace = $s');
  }
  on TypeError {
    print('Erro de tipo');
  }
  on Exception {
    print('Erro idade == 38');
  }
  catch (erro) {
    print('Erro ao executar programa');
  }
  finally {
    print('finally');
  }
}
