import 'dart:convert';

class TaskModel {
  TaskModel({
    required this.id,
    required this.description,
    required this.dateTime,
    required this.finished,
  });

  final int id;
  final String description;
  final DateTime dateTime;
  final bool finished;  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': description,
      'data_hora': dateTime.millisecondsSinceEpoch,
      'finalizado': finished,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id']?.toInt() ?? 0,
      description: map['descricao'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['data_hora']),
      finished: map['finalizado'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source));
}
