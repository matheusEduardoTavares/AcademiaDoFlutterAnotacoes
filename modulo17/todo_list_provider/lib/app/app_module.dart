import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/app_widget.dart';
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';

///Tudo que for compartilhado por toda a
///aplicação ficará dentro deste AppModule,
///é o módulo core do sistema, fica todas as 
///classes compartilhada por vários módulos,
///ficará aqui as dependências que ficam
///na memória todo o tempo enquanto o APP está
///rodando. Cada módulo específico terá também
///dependências específicas que só ficarão ativas 
///quando aquele módulo estiver ativo
class AppModule extends StatelessWidget {
  const AppModule({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => SqliteConnectionFactory(),
          lazy: false,
        ),
      ],
      child: AppWidget(),
    );
  }
}