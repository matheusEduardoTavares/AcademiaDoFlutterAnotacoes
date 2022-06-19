import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListCubitPage extends StatelessWidget {

  const ContactListCubitPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('List Cubit'),),
           floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.of(context).pushNamed('/contacts/cubit/register');

              context.read<ContactListCubit>().findAll();
            },
           ),
           body: RefreshIndicator(
             onRefresh: () {
              context.read<ContactListCubit>()
                .findAll();

              return Future.value();
             }, 
             child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Column(
                    children: [
                      Loader<ContactListCubit, ContactListCubitState>(
                        selector: (state) {
                          return state.maybeWhen(
                            loading: () => true,
                            orElse: () => false,
                          );
                        }
                      ),
                      BlocSelector<ContactListCubit, ContactListCubitState, List<ContactModel>>(
                        selector: (state) => state.maybeWhen(
                          data: (contacts) => contacts,
                          orElse: () => <ContactModel>[],
                        ), 
                        builder: (_, contacts) => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: contacts.length,
                          itemBuilder: (_, index) {
                            final contact = contacts[index];

                            return ListTile(
                              title: Text(contact.name),
                              subtitle: Text(contact.email),
                              onLongPress: () => context.read<ContactListCubit>()
                                .deleteByModel(contact),
                              onTap: () async {
                                await Navigator.of(context).pushNamed(
                                  '/contacts/cubit/update',
                                  arguments: contact,
                                );

                                context.read<ContactListCubit>()
                                  .findAll();
                              },
                            );
                          }
                        )
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