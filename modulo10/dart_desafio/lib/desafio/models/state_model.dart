import 'dart:convert';

class StateModel {
  StateModel({
    required this.id,
    required this.uf,
    required this.name,
  });

  final int id;
  final String uf;
  final String name;  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': uf,
      'nome': name,
    };
  }

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      id: map['id']?.toInt() ?? 0,
      uf: map['sigla'] ?? '',
      name: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StateModel.fromJson(String source) => StateModel.fromMap(json.decode(source));

  @override
  String toString() => 'StateModel(id: $id, uf: $uf, name: $name)';
}
