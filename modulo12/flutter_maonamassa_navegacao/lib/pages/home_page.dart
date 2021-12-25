import 'package:flutter/material.dart';
import 'package:flutter_maonamassa_navegacao/pages/detalhe_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('HomePage'),),
           body: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 TextButton(
                   onPressed: () {
                     Navigator.of(context).pushNamed('/detalhe', arguments: 'Parametro X');
                   },
                   child: Text('Ir para detalhe'),
                 ),
                 TextButton(
                   onPressed: () {
                     Navigator.of(context).push(
                       MaterialPageRoute(
                         builder: (context) => DetalhePage(
                           parametro: 'Parâmetro pelo page Route',
                         ),
                         settings: RouteSettings(
                           name: '/detalhe',
                           arguments: 'Parâmetro pelo page route'
                         ),
                        ),
                     );
                   },
                   child: Text('Ir para detalhe PageRoute'),
                 ),
                 TextButton(
                   onPressed: () async {
                      final message = await Navigator.of(context).pushNamed('/detalhe2');
                      debugPrint('Mensagem recebida da página: $message');
                   },
                   child: Text('Ir para detalhe2 e aguardar'),
                 ),
               ],
             ),
           ),
       );
  }
}