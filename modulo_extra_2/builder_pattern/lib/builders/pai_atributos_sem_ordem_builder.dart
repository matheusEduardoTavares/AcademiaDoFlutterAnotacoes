import 'package:builder_pattern/models/filho_model.dart';
import 'package:builder_pattern/models/pai_model.dart';

class PaiAtributosSemOrdemBuilder {
  PaiAtributosSemOrdemBuilder._();

  static final _instance = PaiAtributosSemOrdemBuilder._();

  final _model = PaiModel();

  static PaiAtributosSemOrdemBuilder get instance => _instance;

  PaiAtributosSemOrdemBuilder setNome(String nome) {
    _model.nome = nome;
    return this;
  }

  PaiAtributosSemOrdemBuilder setIdade(int idade) {
    _model.idade = idade;
    return this;
  }

  PaiAtributosSemOrdemBuilder setProfissao(String profissao) {
    _model.profissao = profissao;
    return this;
  }

  PaiAtributosSemOrdemBuilder addFilho(FilhoModel filho) {
    _model.filhos ??= [];
    _model.filhos!.add(filho);
    return this;
  }

  PaiModel builder() {
    return _model;
  }
}