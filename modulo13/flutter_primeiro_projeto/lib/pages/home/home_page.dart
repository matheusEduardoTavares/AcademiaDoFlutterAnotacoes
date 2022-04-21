import 'package:flutter/material.dart';

enum PopupMenuPages {
  container,
  rowsColumns,
  mediaQuery,
  layoutBuilder,
  botoesRotacaoTexto,
  singleChildScrollView,
  listView,
  dialogs,
  snackbar,
  forms,
  leituraJson,
  stack,
  stack2,
  bottomNavigatorBar,
  circleAvatar,
  colors,
  materialBanner,
  desafio,
}

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
            actions: [
              PopupMenuButton<PopupMenuPages>(
                // initialValue: PopupMenuPages.container,
                // icon: Icon(Icons.restaurant_menu),
                tooltip: 'Selecione um item do menu',
                onSelected: (PopupMenuPages valueSelected) {
                  switch (valueSelected) {
                    case PopupMenuPages.container:
                      Navigator.of(context).pushNamed('/container');
                      break;
                    case PopupMenuPages.rowsColumns:
                      Navigator.of(context).pushNamed('/rows_columns');
                      break;
                    case PopupMenuPages.mediaQuery:
                      Navigator.of(context).pushNamed('/media_query');
                      break;
                    case PopupMenuPages.layoutBuilder:
                      Navigator.of(context).pushNamed('/layout_builder');
                      break;
                    case PopupMenuPages.botoesRotacaoTexto:
                      Navigator.of(context).pushNamed('/botoes_rotacao_texto');
                      break;
                    case PopupMenuPages.singleChildScrollView:
                      Navigator.of(context).pushNamed('/scrolls/single_child_scroll_view');
                      break;
                    case PopupMenuPages.listView:
                      Navigator.of(context).pushNamed('/scrolls/list_view');
                      break;
                    case PopupMenuPages.dialogs:
                      Navigator.of(context).pushNamed('/dialogs');
                      break;
                    case PopupMenuPages.snackbar:
                      Navigator.of(context).pushNamed('/snackbar');
                      break;
                    case PopupMenuPages.forms:
                      Navigator.of(context).pushNamed('/forms');
                      break;
                    case PopupMenuPages.leituraJson:
                      Navigator.of(context).pushNamed('/leituraJson');
                      break;
                    case PopupMenuPages.stack:
                      Navigator.of(context).pushNamed('/stack');
                      break;
                    case PopupMenuPages.stack2:
                      Navigator.of(context).pushNamed('/stack2');
                      break;
                    case PopupMenuPages.bottomNavigatorBar:
                      Navigator.of(context).pushNamed('/bottomNavigatorBar');
                      break;
                    case PopupMenuPages.circleAvatar:
                      Navigator.of(context).pushNamed('/circleAvatar');
                      break;
                    case PopupMenuPages.colors:
                      Navigator.of(context).pushNamed('/colors');
                      break;
                    case PopupMenuPages.materialBanner:
                      Navigator.of(context).pushNamed('/materialBanner');
                      break;
                    case PopupMenuPages.desafio:
                      Navigator.of(context).pushNamed('/desafio');
                      break;
                  }
                },
                itemBuilder: (_) => <PopupMenuItem<PopupMenuPages>>[
                  PopupMenuItem(
                    value: PopupMenuPages.container,
                    child: Text('Container'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.rowsColumns,
                    child: Text('Rows & Columns'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.mediaQuery,
                    child: Text('MediaQuery'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.layoutBuilder,
                    child: Text('LayoutBuilder'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.botoesRotacaoTexto,
                    child: Text('Botões e rotação de texto'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.singleChildScrollView,
                    child: Text('SingleChildScrollView'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.listView,
                    child: Text('ListView'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.dialogs,
                    child: Text('Dialogs'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.snackbar,
                    child: Text('Snackbar'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.forms,
                    child: Text('Forms'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.leituraJson,
                    child: Text('Lendo JSON'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.stack,
                    child: Text('Stack'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.stack2,
                    child: Text('Stack2'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.bottomNavigatorBar,
                    child: Text('bottomNavigatorBar'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.circleAvatar,
                    child: Text('circleAvatar'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.colors,
                    child: Text('colors'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.materialBanner,
                    child: Text('MaterialBanner'),
                  ),
                  PopupMenuItem(
                    value: PopupMenuPages.desafio,
                    child: Text('Desafio'),
                  ),
                ],
              )
            ],
          ),
          body: Theme(
            data: Theme.of(context).copyWith(
              primaryColorDark: Colors.blueGrey,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black12,
                )
              )
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Botão X'),
                  ),
                  ContainerX(),
                  Container(
                    height: 100,
                    width: 100,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  Builder(
                    builder: (context) => Container(
                      height: 100,
                      width: 100,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
       );
  }
}

class ContainerX extends StatelessWidget {
  const ContainerX({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Theme.of(context).primaryColorDark,
    );
  }
}