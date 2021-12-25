import 'package:flutter/material.dart';

enum PopupMenuPages {
  container,
  rowsColumns,
  mediaQuery,
  layoutBuilder
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
                ],
              )
            ],
          ),
          body: Container(),
       );
  }
}