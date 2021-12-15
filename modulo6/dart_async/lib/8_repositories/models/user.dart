import 'dart:convert';

import 'user_types.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.userTypes,
  });
  
  final String id;
  final String name;
  final String userName;
  final List<UserTypes> userTypes;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': userName,
      'user_types': userTypes.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      userName: map['username'] ?? '',
      userTypes: List<UserTypes>.from((map['user_types'] ?? [])?.map((x) => UserTypes.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, userName: $userName, userTypes: $userTypes)';
  }
}
