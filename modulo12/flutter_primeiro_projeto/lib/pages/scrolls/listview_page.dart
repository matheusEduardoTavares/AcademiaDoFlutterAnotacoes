import 'package:flutter/material.dart';

class ListviewPage extends StatelessWidget {

  const ListviewPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('ListView Page'),),
          //  body: ListView(
          //    children: [
          //      Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 200,
          //         color: Colors.red,
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 200,
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 200,
          //         color: Colors.green,
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 200,
          //         color: Colors.amber,
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 200,
          //         color: Colors.black,
          //       ),
          //    ],
          //  ),

          ///BUILDER
          // body: ListView.builder(
          //   itemCount: 1000,
          //   itemBuilder: (_, index) {
          //     debugPrint('Carregando o índice $index');
          //     // return SizedBox(child: Text('O item $index'), height: 300,);
          //     return ListTile(
          //       title: Text('Índice $index'),
          //       subtitle: Text('Flutter é TOP'),
          //       leading: CircleAvatar(),
          //     );
          //   },
          // ),
          body: ListView.separated(
            itemCount: 1000,
            separatorBuilder: (_, index) {
              return Divider(
                color: Colors.red,
                // thickness: 2,
              );
              // return Container(
              //   color: Colors.black,
              //   height: 10,
              //   width: MediaQuery.of(context).size.width,
              // );
            },
            itemBuilder: (_, index) {
              debugPrint('Carregando o índice $index');
              // return SizedBox(child: Text('O item $index'), height: 300,);
              return ListTile(
                title: Text('Índice $index'),
                subtitle: Text('Flutter é TOP'),
                leading: CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: NetworkImage(
                    'https://www.solivatech.com/assets/uploads/media-uploader/flutter-app-development-company1623499975.jpg'
                  ),
                ),
                trailing: CircleAvatar(),
              );
            },
          ),
       );
  }
}