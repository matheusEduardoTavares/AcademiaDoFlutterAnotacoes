import 'dart:convert';

class ConfirmLoginModel {
  ConfirmLoginModel({
    required this.accessToken,
    required this.refreshToken,
  });

  ///Dentro do processo de login, quando recebemos
  /// o accessToken, precisamos atualizar ele com 
  /// algumas informações, por isso na parte de 
  /// confirmação de login terá um novo accessToken
  final String accessToken;
  final String refreshToken;  

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  factory ConfirmLoginModel.fromMap(Map<String, dynamic> map) {
    return ConfirmLoginModel(
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirmLoginModel.fromJson(String source) => ConfirmLoginModel.fromMap(json.decode(source));
}
