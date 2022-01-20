import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/models/user_model.dart';
import 'package:cuidapet_mobile/app/modules/core/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class AuthHomePage extends StatefulWidget {
  const AuthHomePage({ 
    Key? key,
    required AuthStore authStore,
  }) : 
    _authStore = authStore,
    super(key: key);

  final AuthStore _authStore;

  @override
  _AuthHomePageState createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  // final _reactionsDisposers = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    // final userModelReaction = reaction<UserModel?>((_) => widget._authStore.userModel, (userModel) {
    reaction<UserModel?>((_) => widget._authStore.userModel, (userModel) {
      if (userModel != null && userModel.email.isNotEmpty) {
        Modular.to.navigate('/home');
      }
      else {
        Modular.to.navigate('/auth/login');
      }
    });

    // _reactionsDisposers.addAll([
    //   userModelReaction,
    // ]);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      widget._authStore.loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 162.w,
          height: 130.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   for (final disposer in _reactionsDisposers) {
  //     disposer();
  //   }

  //   super.dispose();
  // }
}