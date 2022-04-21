import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensons.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Selector<AuthProvider, String>(
        selector: (_, authProvider) => authProvider.user?.displayName ?? 'Não Informado',
        builder: (_, value, __) => Text(
          'E aí, $value!',
          style: context.textTheme.headline5?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}