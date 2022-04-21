import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Nossa primeira AppBar'),
    //       backgroundColor: Colors.green,
    //       actions: [
    //         IconButton(
    //           onPressed: () {
                
    //           }, 
    //           icon: const Icon(Icons.add_link_outlined)
    //         ),
    //         IconButton(
    //           onPressed: () {

    //           }, 
    //           icon: const Icon(Icons.airplanemode_inactive_outlined)
    //         ),
    //         IconButton(
    //           onPressed: () {

    //           }, 
    //           icon: const Icon(Icons.airline_seat_individual_suite_rounded)
    //         ),
    //       ],
    //     ),
    //     body: const Center(
    //       child: Text(
    //         'Nossa Home Page'
    //       ),
    //     ),
    //     drawer: const Drawer(
    //       child: Center(
    //         child: Text(
    //           'Drawer aberta'
    //         ),
    //       ),
    //     ),
    //     endDrawer: const Drawer(
    //       child: Center(
    //         child: Text(
    //           'Drawer end'
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    // return const Center(
    //   child: Text(
    //     'Nossa Home Page'
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nossa primeira AppBar',
          style: TextStyle(
            fontFamily: 'Tourney'
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Academia do Flutter Custom Font',
              style: TextStyle(
                fontFamily: 'Tourney',
                color: Colors.black,
                fontSize: 40
              ),
            ),
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                    offset: Offset(10, 10),
                  ),
                  BoxShadow(
                    color: Colors.green,
                    blurRadius: 20,
                    offset: Offset(-10, -10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}