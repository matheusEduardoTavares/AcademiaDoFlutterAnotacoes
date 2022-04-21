import 'dart:convert';

class CityModel {
  CityModel({
    required this.id,
    required this.idUF,
    required this.name,
  });

  final int id;
  final int idUF;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_uf': idUF,
      'nome': name,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id']?.toInt() ?? 0,
      idUF: map['id_uf']?.toInt() ?? 35,
      name: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source));

  @override
  String toString() => 'CityModel(id: $id, idUF: $idUF, name: $name)';
}
