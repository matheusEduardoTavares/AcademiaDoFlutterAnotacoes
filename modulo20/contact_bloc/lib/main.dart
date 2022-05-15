import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_example.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed_example.dart';
import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/features/contacts/list/contacts_list_page.dart';
import 'package:contact_bloc/features/contacts/register/contact_register_page.dart';
import 'package:contact_bloc/features/contacts/update/contact_update_page.dart';
import 'package:contact_bloc/home/home_page.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ContactsRepository(),
      child: MaterialApp(
        initialRoute: '/home',
        title: 'Contact BLOC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/home': (_) => const HomePage(),
          '/bloc/example': (_) => BlocProvider(
            create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
            child: const BlocExample(),
          ),
          '/bloc/example/freezed': (_) => BlocProvider(
            create: (_) => ExampleFreezedBloc()..add(ExampleFreezedEvent.findNames()),
            child: const BlocFreezedExample(),
          ),
          '/contacts/list': (context) => BlocProvider(
            create: (_) => ContactListBloc(
              repository: context.read()
            )..add(const ContactListEvent.findAll()),
            child: const ContactsListPage(),
          ),
          '/contacts/register': (context) => BlocProvider(
            create: (_) => ContactListBloc(
              repository: context.read()
            )..add(const ContactListEvent.findAll()),
            child: const ContactRegisterPage(),
          ),
          '/contacts/update': (context) => BlocProvider(
            create: (_) => ContactListBloc(
              repository: context.read()
            )..add(const ContactListEvent.findAll()),
            child: const ContactUpdatePage(),
          ),
        },
      ),
    );
  }
}