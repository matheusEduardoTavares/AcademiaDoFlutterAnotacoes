import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao/page1.dart';

class Page4 extends StatelessWidget {

  const Page4({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Page4'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ///Removendo todas as paginas deixando só
                  ///a primeira
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      settings: RouteSettings(
                        name: 'page1',
                      ),
                      builder: (context) => Page1(),
                    ),
                    // (route) => route.isFirst,
                    ///Agora para não deixar nenhuma página na stack
                    ///e dar o push no primeiro parâmetro
                    (route) => false,
                  );
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     settings: RouteSettings(
                  //       name: 'page1',
                  //     ),
                  //     builder: (context) => Page1(),
                  //   ),
                  //   ModalRoute.withName('page2'),
                  // );
                }, 
                child: Text('Page1 via PAGE')
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text('pop')
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/page1', ModalRoute.withName('/page2'));
                }, 
                child: Text('Page4 via Named')
              ),
            ],
          ),
        ),
    );
  }
}