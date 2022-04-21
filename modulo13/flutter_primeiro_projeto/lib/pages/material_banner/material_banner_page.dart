import 'package:flutter/material.dart';

class MaterialBannerPage extends StatelessWidget {

  const MaterialBannerPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('MaterialBanner'),),
           body: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(onPressed: () {
                   final materialBanner = MaterialBanner(
                     content: Text('Usuário salvo com sucesso'),
                     backgroundColor: Colors.amber,
                     actions: [
                       TextButton(
                         onPressed: () {
                           ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
                         },
                         child: Text('Cancelar', style: TextStyle(color: Colors.red),),
                       )
                     ],
                   );
                   ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);
                    Future.delayed(Duration(seconds: 2), () {
                      ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
                    });


                 }, child: Text('Simple MaterialBanner')),
               ],
             ),
           ),
       );
  }
}