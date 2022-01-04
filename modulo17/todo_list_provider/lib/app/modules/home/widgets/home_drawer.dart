import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensons.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({ Key? key }) : super(key: key);

  final nameValueNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(70)
            ),
            child: Row(
              children: [
                Selector<AuthProvider, String>(
                  selector: (_, authProvider) {
                    return authProvider.user?.photoURL ?? 
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png';

                  },
                  builder: (context, value, __) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(value),
                      radius: 30,
                    );
                  }
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Selector<AuthProvider, String>(
                      selector: (_, authProvider) {
                        return authProvider.user?.displayName ?? 
                          'Não informado';
                      },
                      builder: (context, value, __) {
                        return  Text(
                          value,
                          style: context.textTheme.subtitle2,
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context, 
                builder: (_) => AlertDialog(
                  title: Text('Alterar Nome'),
                  content: TextField(
                    onChanged: (value) {
                      nameValueNotifier.value = value;
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, 
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        final nameValue = nameValueNotifier.value;
                        if (nameValue.isEmpty) {
                          Messages.of(context).showError('Nome obrigatório');
                        }
                        else {
                          await context.read<UserService>().updateDisplayName(nameValue);
                          Navigator.of(context).pop();
                        }
                      }, 
                      child: Text('Alterar'),
                    ),
                  ],
                ),
              );
            },
            title: Text('Alterar Nome'),
          ),
          ListTile(
            onTap: () => context.read<AuthProvider>().logout(),
            title: Text('Sair'),
          ),
        ],
      ),
    );
  }
}