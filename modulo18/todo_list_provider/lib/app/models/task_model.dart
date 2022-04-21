import 'dart:convert';

class TaskModel {
  TaskModel({
    required this.id,
    required this.description,
    required this.dateTime,
    required this.finished,
    required this.firebaseUserUID,
  });

  final int id;
  final String description;
  final DateTime dateTime;
  final bool finished;  
  final String firebaseUserUID;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': description,
      'data_hora': dateTime.toIso8601String(),
      'finalizado': finished,
      'firebaseUserUID': firebaseUserUID,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id']?.toInt() ?? 0,
      description: map['descricao'] ?? '',
      dateTime: DateTime.parse(map['data_hora']),
      finished: map['finalizado'] == 1,
      firebaseUserUID: map['firebaseUserUID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source));

  TaskModel copyWith({
    int? id,
    String? description,
    DateTime? dateTime,
    bool? finished,
    String? firebaseUserUID,
  }) {
    return TaskModel(
      id: id ?? this.id,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      finished: finished ?? this.finished,
      firebaseUserUID: firebaseUserUID ?? this.firebaseUserUID,
    );
  }
}
