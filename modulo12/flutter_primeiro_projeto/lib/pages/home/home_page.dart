import 'package:flutter/material.dart';

enum PopupMenuPages {
  container,
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
                  }
                },
                itemBuilder: (_) => <PopupMenuItem<PopupMenuPages>>[
                  PopupMenuItem(
                    value: PopupMenuPages.container,
                    child: Text('Container'),
                  ),
                ],
              )
            ],
          ),
          body: Container(),
       );
  }
}