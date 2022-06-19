import 'package:bloc_test/bloc_test.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsRepository extends Mock implements ContactsRepository {}

void main() {
  // declaração
  late ContactsRepository repository;
  late ContactListCubit bloc;
  late List<ContactModel> contacts;

  // preparação
  setUp(() {
    repository = MockContactsRepository();
    bloc = ContactListCubit(
      repository: repository,
    );
    contacts = [
      ContactModel(
        name: 'Rodrigo Rahman', 
        email: 'rodrigorahman@academiadoflutter.com.br'
      ),
      ContactModel(
        name: 'Rodrigo Rahman Pessoal', 
        email: 'rodrigorahman@gmail.com'
      ),
    ];
  });

  // execução
  blocTest<ContactListCubit, ContactListCubitState>(
    'Deve buscar os contatos',
    build: () => bloc,
    act: (bloc) => bloc.findAll(),
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.data(contacts: contacts),
    ],
    setUp: () {
      when(() => repository.findAll()).thenAnswer((_) async => contacts);
    },
  );

  blocTest<ContactListCubit, ContactListCubitState>(
    'Deve dar erro ao buscar os contatos',
    build: () => bloc,
    act: (bloc) => bloc.findAll(),
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.error(error: 'Erro ao buscar contatos'),
    ],
  );
}