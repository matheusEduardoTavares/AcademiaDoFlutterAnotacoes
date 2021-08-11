import 'package:builder_pattern/models/filho_model.dart';
import 'package:builder_pattern/models/pai_model.dart';

class PaiAtributosComOrdemBuilder implements NomeContrato, IdadeContrato, ProfissaoContrato, FilhoContrato {
  PaiAtributosComOrdemBuilder._();

  final _model = PaiModel();

  static final _instance = PaiAtributosComOrdemBuilder._();

  static NomeContrato get instance => _instance;

  ///Os campos que não são obrigatórios preencher basta que a interface tenha
  ///implementado o builder

  @override
  IdadeContrato setNome(String nome) {
    _model.nome = nome;
    return this;
  }

  @override
  ProfissaoContrato setIdade(int idade) {
    _model.idade = idade;
    return this;
  }

  @override
  FilhoContrato setProfissao(String profissao) {
    _model.profissao = profissao;
    return this;
  }

  @override
  FilhoContrato addFilho(FilhoModel filho) {
    _model.filhos ??= [];
    _model.filhos!.add(filho);
    return this;
  }

  @override
  PaiModel builder() {
    return _model;
  }
}

///INTERFACES, contratos que fazemos e que por sua vez obrigam o usuário a 
///setar com uma certa ordem os campos do builder
abstract class NomeContrato {
  IdadeContrato setNome(String nome);
}

abstract class IdadeContrato {
  ProfissaoContrato setIdade(int idade);
  // PaiModel builder();
}

abstract class ProfissaoContrato {
  FilhoContrato setProfissao(String profissao);
}

abstract class FilhoContrato {
  FilhoContrato addFilho(FilhoModel filho);
  PaiModel builder();
}