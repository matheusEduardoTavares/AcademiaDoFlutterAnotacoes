import 'package:flutter/material.dart';

enum PopupMenuPages {
  container,
  rowsColumns,
  mediaQuery,
  layoutBuilder,
  botoesRotacaoTexto,
  singleChildScrollView,
  listView,
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
                ],
              )
            ],
          ),
          body: Container(),
       );
  }
}