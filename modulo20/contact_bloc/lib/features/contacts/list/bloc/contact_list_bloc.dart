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
}