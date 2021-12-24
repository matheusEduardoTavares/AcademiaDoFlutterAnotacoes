import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao/page3.dart';

class Page2 extends StatelessWidget {

  const Page2({ Key? key }) : super(key: key);

  static const String routeName = '/page2';

   @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Page2'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      settings: RouteSettings(
                        name: 'page3',
                      ),
                      builder: (context) => Page3(),
                    )
                  );
                }, 
                child: Text('Page3 via PAGE')
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text('pop')
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/page3');
                }, 
                child: Text('Page3 via Named')
              ),
            ],
          ),
        ),
    );
  }
}