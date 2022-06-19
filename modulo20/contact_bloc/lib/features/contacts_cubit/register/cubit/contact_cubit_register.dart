import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_cubit_register_state.dart';
part 'contact_cubit_register.freezed.dart';

class ContactCubitRegister extends Cubit<ContactCubitRegisterState> {
  ContactCubitRegister({
    required ContactsRepository repository,
  }) : 
  _repository = repository,
  super(ContactCubitRegisterState.initial());

  final ContactsRepository _repository;

  Future<void> create(ContactModel model) async {
    try {
      emit(ContactCubitRegisterState.loading());
      
      await Future.delayed(const Duration(seconds: 2));
      await _repository.create(model);
      
      emit(ContactCubitRegisterState.success());
    } catch (e, s) {
      const errorMessage = 'Erro ao criar model';
      log(errorMessage, error: e, stackTrace: s);

      emit(ContactCubitRegisterState.error(error: errorMessage));
    }
  }
}