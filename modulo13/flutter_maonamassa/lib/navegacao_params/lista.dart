import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao_params/detalhe.dart';

class Lista extends StatelessWidget {

  const Lista({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista'),),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     settings: RouteSettings(
                //       name: 'detalhe',
                //       arguments: const {
                //         'id': 20
                //       }
                //     ),
                //     builder: (_) => Detalhe(),
                //   )
                // );
                Navigator.of(context)
                  .pushNamed(
                    '/detalhe',
                    arguments: const {
                      'id': 30
                    }
                  );
              }, 
              child: Text('detalhes')
            ),
          ],
        ),
      ),
    );
  }
}