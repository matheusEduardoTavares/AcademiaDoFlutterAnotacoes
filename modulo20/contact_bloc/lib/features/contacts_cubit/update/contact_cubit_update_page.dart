import 'package:contact_bloc/features/contacts_cubit/update/cubit/contact_cubit_update.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubitUpdatePage extends StatefulWidget {
  const ContactCubitUpdatePage({ContactModel? model, Key? key})
      : _model = model,
        super(key: key);

  final ContactModel? _model;

  @override
  State<ContactCubitUpdatePage> createState() =>
      _ContactCubitUpdatePageState();
}

class _ContactCubitUpdatePageState extends State<ContactCubitUpdatePage> {
  late final TextEditingController _nameEC;
  late final TextEditingController _emailEC;

  @override
  void initState() {
    _emailEC = TextEditingController(text: widget._model?.email);
    _nameEC = TextEditingController(text: widget._model?.name);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactCubitUpdatePage'),
      ),
      body: BlocListener<ContactCubitUpdate, ContactCubitUpdateState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () => Navigator.of(context).pop(),
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Nome'),
                        controller: _nameEC,
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'E-mail'),
                        controller: _emailEC,
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                    .read<ContactCubitUpdate>()
                    .update(ContactModel(
                      name: _nameEC.text, 
                      email: _emailEC.text,
                      id: widget._model?.id,
                    ));
                }, 
                child: const Text('ATUALIZAR')
              ),
              Loader<ContactCubitUpdate, ContactCubitUpdateState>(
                selector: (state) => state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();

    super.dispose();
  }
}
