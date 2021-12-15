import 'dart:convert';

class UserTypes {
  UserTypes({
    required this.id,
    required this.userId,
    required this.name,
  });
  
  final String id;
  final String userId;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
    };
  }

  factory UserTypes.fromMap(Map<String, dynamic> map) {
    return UserTypes(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTypes.fromJson(String source) => UserTypes.fromMap(json.decode(source));

  @override
  String toString() => 'UserTypes(id: $id, userId: $userId, name: $name)';
}
