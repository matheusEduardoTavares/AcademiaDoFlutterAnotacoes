import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_update_event.dart';
part 'contact_update_state.dart';
part 'contact_update_bloc.freezed.dart';

class ContactUpdateBloc extends Bloc<ContactUpdateEvent, ContactUpdateState> {
  ContactUpdateBloc({
    required ContactsRepository repository,
  }) : 
  _repository = repository,
  super(const _Initial()) {
    on<_Save>(_save);
  }

  final ContactsRepository _repository;

  Future<FutureOr<void>> _save(_Save event, Emitter<ContactUpdateState> emit) async {
    try {
      emit(const ContactUpdateState.loading());

      await Future.delayed(const Duration(seconds: 2));

      final model = ContactModel(
        id: event.id,
        name: event.name, 
        email: event.email,
      );
      
      await _repository.update(model);
      emit(const ContactUpdateState.success());
    } catch (e, s) {
      log('Erro ao atualizar o contato', error: e, stackTrace: s);
      emit(const ContactUpdateState.error(message: 'Erro ao atualizar o contato'));
    }
  }
}
