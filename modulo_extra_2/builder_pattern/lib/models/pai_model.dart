import 'package:builder_pattern/models/filho_model.dart';

class PaiModel {
  PaiModel({
    this.nome,
    this.idade,
    this.profissao,
    this.filhos,
  });
  
  String? nome;
  int? idade;
  String? profissao;
  List<FilhoModel>? filhos;

  @override 
  String toString() => 'PaiModel(nome = $nome, idade = $idade, profissao = $profissao, filhos = $filhos)';
}
