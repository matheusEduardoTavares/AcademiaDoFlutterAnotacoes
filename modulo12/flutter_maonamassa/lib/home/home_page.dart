import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nossa primeira AppBar'),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {
                
              }, 
              icon: const Icon(Icons.add_link_outlined)
            ),
            IconButton(
              onPressed: () {

              }, 
              icon: const Icon(Icons.airplanemode_inactive_outlined)
            ),
            IconButton(
              onPressed: () {

              }, 
              icon: const Icon(Icons.airline_seat_individual_suite_rounded)
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'Nossa Home Page'
          ),
        ),
        drawer: const Drawer(
          child: Center(
            child: Text(
              'Drawer aberta'
            ),
          ),
        ),
        endDrawer: const Drawer(
          child: Center(
            child: Text(
              'Drawer end'
            ),
          ),
        ),
      ),
    );

    // return const Center(
    //   child: Text(
    //     'Nossa Home Page'
    //   ),
    // );
  }
}