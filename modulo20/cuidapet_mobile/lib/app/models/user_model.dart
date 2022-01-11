class UserModel {
  UserModel({
    required this.email,
    required this.registerType,
    required this.imgAvatar,
  });

  UserModel.empty() : 
    email = '',
    registerType = '',
    imgAvatar = '';

  final String email;
  final String registerType;
  final String imgAvatar;  
}