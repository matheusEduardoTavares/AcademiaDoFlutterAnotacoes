import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';
part 'contact_list_bloc.freezed.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactListBloc({
    required ContactsRepository repository
  }) : 
  _repository = repository,
  super(ContactListState.initial()) {
    on<_ContactListEventFindAll>(_findAll);
    on<_ContactListEventDelete>(_deleteContact);
  }

  final ContactsRepository _repository;

  Future<void> _findAll(
    _ContactListEventFindAll event,
    Emitter<ContactListState> emit,
  ) async {
    try {
      emit(ContactListState.loading());
      final contacts = await _repository.findAll();
      emit(ContactListState.data(contacts: contacts));
    } catch (e, s) {
      log(
        'Erro ao buscar contatos',
        error: e,
        stackTrace: s,
      );

      emit(ContactListState.error(error: 'Erro ao buscar contatos'));
    }
  }

  Future<void> _deleteContact(
    _ContactListEventDelete event,
    Emitter<ContactListState> emit,
  ) async {
    try {
      emit(ContactListState.loading());
      await Future.delayed(const Duration(seconds: 2));
      await _repository.delete(event.model);

      add(const ContactListEvent.findAll());
    } catch (e, s) {
      final errorMessage = 'Erro ao deletar contato ${event.model}';
      log(
        errorMessage,
        error: e,
        stackTrace: s,
      );

      emit(ContactListState.error(error: errorMessage));
    }
  }
}