import 'dart:convert';

class Cidade {
  Cidade({
    required this.estado,
    required this.cidade,
  });

  final String estado;
  final String cidade;

  Map<String, dynamic> toMap() {
    return {
      'estado': estado,
      'cidade': cidade,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      estado: map['estado'] ?? '',
      cidade: map['cidade'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidade.fromJson(String source) => Cidade.fromMap(json.decode(source));
}
