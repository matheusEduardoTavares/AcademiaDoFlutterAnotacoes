import 'package:cuidapet_mobile/app/core/ui/cuidapet_icons.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/rounded_button_with_icon.dart';
import 'package:cuidapet_mobile/app/models/social_type.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';

class LoginRegisterButtons extends StatelessWidget {
  const LoginRegisterButtons({ 
    Key? key,
    required LoginController loginController,
  }) : 
  _loginController = loginController,
  super(key: key);

  final LoginController _loginController;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        RoundedButtonWithIcon(
          color: const Color(0xFF426783),
          icon: CuidapetIcons.facebook,
          width: .42.sw,
          title: 'Facebook',
          onTap: () => _loginController.socialLogin(
            SocialType.facebook,
          ),
        ),
        RoundedButtonWithIcon(
          color: const Color(0xFFE15031),
          icon: CuidapetIcons.google,
          width: .42.sw,
          title: 'Google',
          onTap: () => _loginController.socialLogin(
            SocialType.google,
          ),
        ),
        RoundedButtonWithIcon(
          color: context.primaryColorDark,
          icon: Icons.mail,
          width: .42.sw,
          title: 'Cadastre-se',
          onTap: () {
            Navigator.of(context)
              .pushNamed('/auth/register/');
          },
        ),
      ],
    );
  }
}