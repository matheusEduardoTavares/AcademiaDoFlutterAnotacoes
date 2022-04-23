import 'package:consumo_api/models/cidade.dart';
import 'package:consumo_api/models/telefone.dart';

class Endereco {
  final String rua;
  final int numero;
  final String cep;
  final Cidade cidade;
  final Telefone telefone;
  
  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
    required this.telefone,
  });
}
