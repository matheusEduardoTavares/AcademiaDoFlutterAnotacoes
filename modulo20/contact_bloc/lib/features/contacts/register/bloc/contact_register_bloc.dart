import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/contact_model.dart';

part 'contact_register_state.dart';
part 'contact_register_bloc.freezed.dart';
part 'contact_register_event.dart';

class ContactRegisterBloc extends Bloc<ContactRegisterEvent, ContactRegisterState> {
  ContactRegisterBloc({
    required ContactsRepository contactsRepository,
  }) : 
  _contactsRepository = contactsRepository,
  super(const ContactRegisterState.initial()) {
    on<_Save>(_save);
  }

  final ContactsRepository _contactsRepository;

  Future<FutureOr<void>> _save(_Save event, Emitter<ContactRegisterState> emit) async {
    try {
      emit(const ContactRegisterState.loading());
      
      final contactModel = ContactModel(
        name: event.name,
        email: event.email,
      );

      await Future.delayed(const Duration(seconds: 2));
      
      await _contactsRepository.create(contactModel);
      emit(const ContactRegisterState.success());
    } catch (e, s) {
      log('Erro ao salvar um novo usuário', error: e, stackTrace: s);
      emit(const ContactRegisterState.error(message: 'Erro ao salvar um novo contato'));
    }
  }
}