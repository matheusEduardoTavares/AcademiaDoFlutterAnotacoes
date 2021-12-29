import 'package:flutter/widgets.dart';

class UserModel extends InheritedWidget {
  const UserModel({
    required this.name,
    required this.imgAvatar,
    required this.birthDate,
    required Widget child,
    Key? key,
  }) : super(
    child: child,
    key: key,
  );
  
  final String name;  
  final String imgAvatar;  
  final String birthDate;

  @override
  bool updateShouldNotify(covariant UserModel oldWidget) {
    return name != oldWidget.name || imgAvatar != oldWidget.imgAvatar ||
      birthDate != oldWidget.birthDate;
  }

  static UserModel of(BuildContext context) {
    var userModel = context.dependOnInheritedWidgetOfExactType<UserModel>();
    assert(userModel != null, 'UserModel not exists in BuildContext');

    return userModel!;
  }
}
