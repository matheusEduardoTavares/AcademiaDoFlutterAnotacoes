import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_cubit_update_state.dart';
part 'contact_cubit_update.freezed.dart';

class ContactCubitUpdate extends Cubit<ContactCubitUpdateState> {
  ContactCubitUpdate({
    required ContactsRepository repository,
  }) : 
  _repository = repository,
  super(ContactCubitUpdateState.initial());

  final ContactsRepository _repository;

  Future<void> update(ContactModel model) async {
    try {
      emit(ContactCubitUpdateState.loading());
      
      await Future.delayed(const Duration(seconds: 2));
      await _repository.update(model);
      
      emit(ContactCubitUpdateState.success());
    } catch (e, s) {
      const errorMessage = 'Erro ao atualizar model';
      log(errorMessage, error: e, stackTrace: s);

      emit(ContactCubitUpdateState.error(error: errorMessage));
    }
  }
}