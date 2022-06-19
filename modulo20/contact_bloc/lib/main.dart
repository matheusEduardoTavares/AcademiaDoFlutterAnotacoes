import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_example.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed_example.dart';
import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/features/contacts/list/contacts_list_page.dart';
import 'package:contact_bloc/features/contacts/register/contact_register_page.dart';
import 'package:contact_bloc/features/contacts/update/bloc/bloc/contact_update_bloc.dart';
import 'package:contact_bloc/features/contacts/update/contact_update_page.dart';
import 'package:contact_bloc/features/contacts_cubit/list/contact_list_cubit_page.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/features/contacts_cubit/register/contact_cubit_register_page.dart';
import 'package:contact_bloc/features/contacts_cubit/register/cubit/contact_cubit_register.dart';
import 'package:contact_bloc/features/contacts_cubit/update/contact_cubit_update_page.dart';
import 'package:contact_bloc/features/contacts_cubit/update/cubit/contact_cubit_update.dart';
import 'package:contact_bloc/home/home_page.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/contacts/register/bloc/contact_register_bloc.dart';
import 'models/contact_model.dart';

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
            create: (context) => ContactRegisterBloc(
              contactsRepository: context.read(),
            ),
            child: const ContactRegisterPage(),
          ),
          '/contacts/update': (context) => BlocProvider(
            create: (context) => ContactUpdateBloc(
              repository: context.read()
            ),
            child: ContactUpdatePage(
              contact: ModalRoute.of(context)!.settings.arguments as ContactModel,
            ),
          ),
          '/contacts/cubit/list': (context) => BlocProvider(
            create: (context) => ContactListCubit(
              repository: context.read()
            )..findAll(),
            child: const ContactListCubitPage(),
          ),
          '/contacts/cubit/register': (context) => BlocProvider(
            create: (context) => ContactCubitRegister(
              repository: context.read()
            ),
            child: ContactCubitRegisterPage(
              model: (ModalRoute.of(context)?.settings.arguments as ContactModel?),
            ),
          ),
          '/contacts/cubit/update': (context) => BlocProvider(
            create: (context) => ContactCubitUpdate(
              repository: context.read()
            ),
            child: ContactCubitUpdatePage(
              model: (ModalRoute.of(context)!.settings.arguments as ContactModel),
            ),
          ),
        },
      ),
    );
  }
}