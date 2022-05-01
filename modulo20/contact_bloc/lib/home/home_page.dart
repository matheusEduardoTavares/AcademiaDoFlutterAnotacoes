import 'package:contact_bloc/home/widgets/button_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ButtonCard(
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc/example');
                },
                title: 'Example',
              ),
              ButtonCard(
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc/example/freezed');
                },
                title: 'Example Freezed',
              ),
              ButtonCard(
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc/example');
                },
                title: 'Contact',
              ),
              ButtonCard(
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc/example');
                },
                title: 'Contact Cubit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}