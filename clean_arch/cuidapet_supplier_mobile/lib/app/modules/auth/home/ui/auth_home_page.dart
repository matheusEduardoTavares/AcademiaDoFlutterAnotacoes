import 'package:cuidapet_supplier_mobile/app/modules/auth/home/presenter/controller/auth_home_controller.dart';
import 'package:cuidapet_supplier_mobile/app/modules/auth/home/presenter/controller/auth_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthHomePage extends StatelessWidget {
  const AuthHomePage({ 
    Key? key,
    required AuthHomeController authHomeController,
  }) : 
  _authHomeController = authHomeController,
  super(key: key);

  final AuthHomeController _authHomeController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthHomeController, AuthHomeState>(
      bloc: _authHomeController..checkIsLogged(),
      listener: (_, state) {
        switch(state.userLoggedStatus) {
          case AuthStatus.empty:
            break;
          case AuthStatus.logged:
            Modular.to.navigate('/home');
            break;
          case AuthStatus.unlogged:
            Modular.to.navigate('/login');
            break;
        }
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}